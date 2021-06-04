int unstarted = 0;
int intro = 1;
int started = 2;
int state = unstarted;

int backRed = 64;
int backGreen = 78;
int backBlue = 92;

boolean appToggled = false;

ArrayList<Button> buttons;

void setup(){
  size(1330,756);
  buttons = new ArrayList<Button>();
  buttons.add(new Button("harvard"));
  buttons.add(new Button("newAppButton"));


}

void draw(){
  PFont font;
  font = loadFont("SitkaBanner-Bold-48.vlw");
  background(backRed, backGreen, backBlue);
  textFont(font);
  rectMode(CENTER);
  textAlign(CENTER);
  
  text(mouseX, 40, 30);
  text(mouseY, 40, 60);
  
  if (state == unstarted){
    fill(183, 195, 243); // introduction stuff
    text("Absolutely Accurate Admissions Simulator", 665, 340);
    textSize(32);
    text("Click anywhere to begin", 665, 400);
  }else if (state == intro){
    fill(#EDF1F5);
    rect(665, 320, 1100, 260, 7);
    String introduction = "It is the year 2050. There are three options for higher education past high school in the United States: Harvard, MIT, and Greendale Community College. The admissions process has been streamlined. Applicants submit one document with their grades, intended major, extracurriculars, and statement of purpose. You are the Admissions Officer. Follow the guidelines for admission. Make Harvard and MIT proud.";
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
  for (Button b : buttons){
    b.click();
  }
  
}
