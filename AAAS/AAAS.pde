int unstarted = 0;
int intro = 1;
int started = 2;
int morning = 3;
int day = 4;
int night = 5;
int state = unstarted;

int backRed = 64;
int backGreen = 78;
int backBlue = 92;

boolean appToggled = false;
boolean decMade = false;
boolean appMade = false;

//morning + night variables
String gm = "Good morning! Time for you to get to work.";
String gn = "Congrats! You reached your daily quota. Go home and get some rest before coming back tomorrow to ruin more teenagers' lives!";

//executor variables
int errorsMade = 0;
int decisionsMade = 0; //total number of decisions made accross all days
int disads = 0;
int numApps = 7; //number of apps in one day
int numDay = 1;
int errorThreshold = 3; //number of errors for one disadulation. threshold of 3 = 2 errors allowed. 3rd one is a disad.
int appsSoFar = 0;
boolean nextApp = false;
boolean nextDay = false;
boolean thresholdChanged = false;

boolean gameOver = false;

//compare method variables
boolean accepted;
Acceptance a;

//error variables
String errorMsg;
boolean mistake;
Error e = new Error();

ArrayList<Button> buttons;
Button newAppButton;
Application app;
Rulebook rules;
Standards standard;



//METHODS THAT MAKE THE GAME RUN

void setup(){
  size(1330,756);
  buttons = new ArrayList<Button>();
  newAppButton = new Button("newAppButton");
  buttons.add(new Button("harvard"));
  buttons.add(newAppButton);
  buttons.add(new Button("mit"));
  buttons.add(new Button("greendale"));
  rules = new Rulebook();
  standard = rules.getStandards();
}

void draw(){
  PFont font;
  font = loadFont("SitkaBanner-Bold-48.vlw");
  background(backRed, backGreen, backBlue);
  textFont(font);
  rectMode(CENTER);
  textAlign(CENTER);
  
  text("x: " + mouseX, 60, 30);
  text("y: " + mouseY, 60, 60);
  
  if (state == unstarted){
    unstarted();
  }else if (state == intro){
    intro();
  }else if(state == morning){
    morning();
  }else if (state == night){
    endOfDay();
  }else{
    //state == day
     if (backRed != 79){
       backRed++;
     } if (backGreen != 98){
       backGreen++;
     } if (backBlue != 114){
       backBlue++;
     }
     
   rules.display();
   
   for (Button b : buttons){
     b.update();
     b.display();
   }
   
   if (accepted){
     a.display();
   }
   
   if (mistake){
     e.display();
   }
    
   if (nextApp){
     appMade = false;
     decMade = false;
     nextApp = false;
   }
   
   if (nextDay){
     state = night;
     errorsMade = 0;
     numDay++;
     numApps += 2;
     appsSoFar = 0;
     nextDay = false;
   }
   
   if (gameOver){
     clear();
     
     textSize(48);
     fill(#ED0509);
     text("Three strikes and you're out! You're FIRED!", 665, 377.5, 1200, 700);
     textSize(28);
     text("Click anywhere to exit.", 665, 700);
     
   }
   
  }
  
}
  
void mousePressed(){
  if (gameOver){
    exit();
  }
  
  if (state == unstarted){
    state = intro;
  }else if (state == intro){
    state = morning;
  }else if (state == morning){
    state = day;
    thresholdChanged = false;
  }else if (state == night){
    state = morning;
  }
  
  if (accepted && (mouseX>437) && (mouseX<787) && (mouseY>85) && (mouseY<245)){
    accepted = false;
//    System.out.println(appsSoFar);
//    System.out.println(numApps);
    appsSoFar++;
    decisionsMade++;
    if (appsSoFar < numApps){
      nextApp = true;
    }else{
      nextApp = false;
      nextDay = true;
    }
  }
  if (mistake && (mouseX>437) && (mouseX<787) && (mouseY>85) && (mouseY<245)){
    mistake = false;
    appsSoFar++;
    decisionsMade++;
    if (appsSoFar < numApps){
      nextApp = true;
    }else{
      nextApp = false;
      nextDay = true;
    }
  }
  
  if (! decMade && appMade){
    for (Button b : buttons){
      if (b.type.equals("harvard") || b.type.equals("mit") || b.type.equals("greendale")){
        if (b.hovering())  b.click(newAppButton.getApp());
      }
    }
  }
  if (! decMade){
    for (Button b : buttons){
      if (b.type.equals("newApp")){
        if (b.hovering())  b.click(newAppButton.getApp());
      }
    }
  }
  
  rules.click(standard);
  
  
}

//VISUAL METHODS (FOR CLARITY)

  void unstarted(){
    fill(183, 195, 243); // introduction stuff
    text("Absolutely Accurate Admissions Simulator", 665, 340);
    textSize(32);
    text("Click anywhere to begin", 665, 400);
  }
  
  void intro(){
    fill(#EDF1F5);
    rect(665, 320, 1100, 260, 7);
    String introduction = "It is the year 2050. There are three options for higher education past high school in the United States: Harvard, MIT, and Greendale Community College. The admissions process has been streamlined. Applicants submit one document with their grades, SAT score, intended major, extracurriculars, and statement of purpose. You are the Admissions Officer. Follow the guidelines for admission. Make Harvard and MIT proud.";
    textSize(32);
    fill(#404E5C);
    text(introduction, 665, 340, 1000, 250);
    fill(#EDF1F5);
    text("Click anywhere to continue", 665, 500);
  }
  
  void morning(){
    fill(#EDF1F5);
    rect(665, 320, 1100, 260, 7);
    String daytime;
    if (errorThreshold == 1){
      daytime = "\nToday is Day " + numDay + ". You will be given " + numApps + " applications to review. You will receive a disadulation for every " + errorThreshold + " mistake you make today.";
    }else{
      daytime = "\nToday is Day " + numDay + ". You will be given " + numApps + " applications to review. You will receive a disadulation for every " + errorThreshold + " mistakes you make today.";
    }
    textSize(32);
    fill(#404E5C);
    text(gm, 665, 395, 1000, 250);
    text(daytime, 665, 395, 1000, 250);
    fill(#EDF1F5);
    text("Click anywhere to continue", 665, 500);
  }
  
  void endOfDay(){
    fill(#EDF1F5);
    rect(665, 320, 1100, 260, 7);
    
    textSize(32);
    fill(#404E5C);
    text(gn, 665, 395, 1000, 250);
    
    String newDisad;
    if (numDay % 3 == 0 && errorThreshold == 2 && ! thresholdChanged){
      System.out.println("hi");
       errorThreshold = 1;
       newDisad = "You've been doing pretty well. I, the supervisor, have decided to be stricter with your disadulations. Now, we expect perfection. You will receive a disadulation as soon as you make a mistake.";
       fill(#404E5C);
       text(newDisad, 665, 395, 1000, 250);
       thresholdChanged = true;
    }else if (numDay % 3 == 0 && errorThreshold == 3 && ! thresholdChanged) {
      System.out.println("hello");
        errorThreshold = 2;
        newDisad = "You've been doing pretty well. I, the supervisor, have decided to be stricter with your disadulations. Now, if you make 2 mistakes, you will receive a disadulation!";
        fill(#404E5C);
        text(newDisad, 665, 395, 1000, 250);
        thresholdChanged = true;
    }
    
    fill(#EDF1F5);
    text("Click anywhere to continue", 665, 500);
    nextApp = true;
  }
  
  

//"BEHIND THE SCENES" METHODS FROM THE JAVA VERSION

void compare(Application app, String college){
    int intDecision = -1;

    if (college.equals("harvard")){
      intDecision = 1;
    }
    if (college.equals("greendale")){
      intDecision = 0;
    }
    if (college.equals("mit")){
      intDecision = 2;
    }

    if (intDecision == app.getCollege()){
      accepted = true;
      a = new Acceptance(app);
    }
    else{
      accepted = false;
      errorMade();
    }
  }
  
  
  void errorMade(){
    errorsMade++;
    mistake = true;

    if (disads == 3){
      gameOver();
    }

    else if (errorThreshold == 1 && errorsMade == errorThreshold){
      disads++;
      errorMsg = "We expected perfection, but you made a mistake. No. You ARE the mistake. Do better.";

      if (disads == 1){
        errorMsg += "\nYou have received a disadulation. You now have " + disads + " disadulation. Three disadulations and you're fired!";
      }
      else if (disads == 3){
        gameOver();
      }
      else{
        errorMsg += "\nYou have received a disadulation. You now have " + disads + " disadulations. Three disadulations and you're fired!";
      }

      errorsMade = 0;
    }

    else if (errorsMade == errorThreshold){
      disads++;

      if (disads == 1){
        errorMsg = "Tut tut. You've made " + errorThreshold + " mistakes. That's a disadulation! You now have " + disads + " disadulation. Three disadulations and you're fired!";
      }
      else if (disads == 3){
        gameOver();
      }
      else{
        errorMsg = "Tut tut. You've made " + errorThreshold + " mistakes. That's a disadulation! You now have " + disads + " disadulations. Three disadulations and you're fired!";
      }

      errorsMade = 0;
    }

    else{
      if (errorsMade == 1){
        errorMsg = "You did a bad job. Be sad. You now have " + errorsMade + " mistake.";
      }else{
        errorMsg = "You did a bad job. Be sad. You now have " + errorsMade + " mistakes.";
      }

      errorMsg += "\nThis is a written warning. If you make " + errorThreshold + " mistakes today, you will receive a full disadulation.";
    }

  }
  
 void gameOver(){
   gameOver = true;
  }
