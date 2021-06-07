public class Rulebook{
  int state = 0; // 0 for closed, 1 for page 1 (basic tut), 2 for specific rules
  Standards standard;
  color ruleText = color(#B85644);

  Rulebook(){
  }
  
  Standards getStandards(){
    return standard;
  }
  
  void newStandard(Application a){
    standard = a.getStand();
  }
  
  void display(){
    fill(#f5f2e0);
    if (state == 0){
      rect(1075, 590, 350, 215, 0, 0, 6, 6);
      fill(#e1d8a3);
      triangle(1220, 698, 1247, 670, 1220, 670);
      textSize(50);
      textAlign(CENTER);
      fill(#B85644);
      text("RULES", 1075, 600);
    }
    else{
      rect(1075, 485, 350, 430, 6);
      strokeWeight(2);
      stroke(#e1d8a3);
      line(900, 485, 1248, 485);
      fill(#e1d8a3);
      triangle(1220, 698, 1247, 670, 1220, 670);
      fill(ruleText);
      
      if (state == 1){
        rulesFirstPage(); // separate method bc it's very long
      }
      
      if (state == 2){
        rulesSecondPage(standard);
      }
    }
    textSize(20);
    textAlign(CENTER);
    text("CLICK TO TURN PAGE", 1125, 687);
  }

  void click(Standards s){
    if (mouseY > 666 && mouseY < 700 && mouseX > 1210 && mouseX < 1250){
      state++;
      if (state == 3){
        state = 0;
      }
    }
  }
  
  void rulesFirstPage(){
      textAlign(LEFT);
      textSize(25);
      text("How To Use Your Station", 915, 305);
      fill(#99FFE7); // new app color
      noStroke();
      circle(955, 350, 50);
      fill(164, 16, 52); // harvard
      circle(1000, 400, 50);
      fill(#ED7D3A);
      circle(1070, 400, 50);
      fill(139, 208, 169);
      circle(1140, 400, 50);
      textAlign(CENTER);
      fill(ruleText);
      textSize(18);
      text("Harvard", 1000, 460);
      text("MIT", 1070, 460);
      text("Greendale", 1150, 460);
      textSize(22);
      text("Use buttons to determine college. \n Follow standards as set by your \n supervisor's mood (See next page.)\n \n Repeated failure to follow these \n guidelines will result in disadulations.", 1073, 520);  
      textAlign(LEFT);      
      fill(ruleText);
      textSize(18);
      text("Click to receive application", 1000, 350);
  }

  void rulesSecondPage(Standards s){
    textAlign(LEFT);
    textSize(25);
    text("Guidelines for Admission", 915, 305);
    textSize(16);
    text("Your supervisor is currently in a " + s.getMoodString() + "mood.", 915, 330);
    
  }



}
