int unstarted = 0;
int started = 1;
int state = unstarted;

int backRed = 64;
int backGreen = 78;
int backBlue = 92;

ArrayList<Button> buttons;

void setup(){
  size(1330,756);
  buttons = new ArrayList<Button>();
  buttons.add(new Button("harvard"));

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
  }
  else{
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
    state = started;
  }
  
}
