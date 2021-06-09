int unstarted = 0;
int intro = 1;
int started = 2;
int state = unstarted;

int backRed = 64;
int backGreen = 78;
int backBlue = 92;

boolean appToggled = false;
boolean decMade = false;
boolean appMade = false;

//executor variables
int errorsMade, decisionsMade, disads, numApps, numDay, errorThreshold;
boolean gameOver = false;
String[] acceptanceLetter = {"We are overjoyed to inform you of your acceptance to ", "Hey, congrats, you got into ",
  "As expected, you got into ", "Is this even a surprise? You got into ", "For the next four years, you will be attending ",
  "Get excited, because you’ve been accepted to ", "Let’s just get it over with. Welcome to ", "Ring the alarm bells! You got into ",
  "Our sincerest condolences, but the only school we could fit you in was (drumroll, please...): ",
  "I hope you like college, because you’re going to "};
  // TOTAL COUNT: 10, for now!
boolean compared;

ArrayList<Button> buttons;
Button newDayButton;
Application app;
Rulebook rules;
Standards standard;

void setup(){
  size(1330,756);
  buttons = new ArrayList<Button>();
  newDayButton = new Button("newDayButton");
  buttons.add(new Button("harvard"));
  buttons.add(newDayButton);
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
    fill(183, 195, 243); // introduction stuff
    text("Absolutely Accurate Admissions Simulator", 665, 340);
    textSize(32);
    text("Click anywhere to begin", 665, 400);
  }else if (state == intro){
    fill(#EDF1F5);
    rect(665, 320, 1100, 260, 7);
    String introduction = "It is the year 2050. There are three options for higher education past high school in the United States: Harvard, MIT, and Greendale Community College. The admissions process has been streamlined. Applicants submit one document with their grades, SAT score, intended major, extracurriculars, and statement of purpose. You are the Admissions Officer. Follow the guidelines for admission. Make Harvard and MIT proud.";
    textSize(32);
    fill(#404E5C);
    text(introduction, 665, 340, 1000, 250);
    fill(#EDF1F5);
    text("Click anywhere to continue", 665, 500);
  }else{
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
    
  }
  
}
  
void mousePressed(){
  if (state == unstarted){
    state = intro;
  }else if (state == intro){
    state = started;
  }
  if (! decMade){
    for (Button b : buttons){
    if (b.hovering())  b.click(newDayButton.getApp());
    }
  }
  
  rules.click(standard);
}


//stuff from executor class in java
 /* void compare(Application app, String college){
    compared = true;
    int intDecision = -1;
  //  String decision = userDecision.toLowerCase();

    if (college.equals("harvard")){ // decision making will be replaced by BUTTONS in processing
      intDecision = 1;
    }
    if (college.equals("greendale")){
      intDecision = 0;
    }
    if (college.equals("mit")){
      intDecision = 2;
    }

    if (intDecision == -1){ // catches bad user input, technically unnecessary but i like dissing people //should not even happen
      System.out.println("How can you call yourself an admissions officer when you can't even choose correctly?");
      errorMade(); // runs failure
    }else  if (intDecision == app.getCollege()){
      System.out.println("cool. cool cool cool"); //for testing purposes
      
    }
    else{
      errorMade();
    }
    //app.clear();
  }
  
  
  void errorMade(){
    errorsMade++;

    if (disads == 3){
      gameOver();
    }

    else if (errorThreshold == 1 && errorsMade == errorThreshold){
      disads++;
      System.out.println("We expected perfection, but you made a mistake. No. You ARE the mistake. Do better.");

      if (disads == 1){
        System.out.println("You have received a disadulation. You now have " + disads + " disadulation. Three disadulations and you're fired!");
      }
      else if (disads == 3){
        gameOver();
      }
      else{
        System.out.println("You have received a disadulation. You now have " + disads + " disadulations. Three disadulations and you're fired!");
      }

      errorsMade = 0;
    }

    else if (errorsMade == errorThreshold){
      disads++;

      if (disads == 1){
        System.out.println("Tut tut. You've made " + errorThreshold + " mistakes. That's a disadulation! You now have " + disads + " disadulation. Three disadulations and you're fired!");
      }
      else if (disads == 3){
        gameOver();
      }
      else{
        System.out.println("Tut tut. You've made " + errorThreshold + " mistakes. That's a disadulation! You now have " + disads + " disadulations. Three disadulations and you're fired!");
      }

      errorsMade = 0;
    }

    else{
      if (errorsMade == 1){
        System.out.println("You did a bad job. Be sad. You now have " + errorsMade + " mistake.");
      }else{
        System.out.println("You did a bad job. Be sad. You now have " + errorsMade + " mistakes.");
      }

      System.out.println("This is a written warning. If you make " + errorThreshold + " mistakes today, you will receive a full disadulation.");
    }

  }
  
  void gameOver(){
    System.out.println("you're fired"); //will be changed, this is just for testing purposes
  }*/
