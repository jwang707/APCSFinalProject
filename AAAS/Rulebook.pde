public class Rulebook{
  int state = 0; // 0 for closed, 1 for page 1 (basic tut), 2 for specific rules
  Standards standard;
  color ruleText = color(#B85644);

  Rulebook(){
    standard = new Standards();
  }
  
  Standards getStandards(){
    return standard;
  }
  
  void display(){
    fill(#f5f2e0);
    if (state == 0){
      rect(1085, 590, 350, 215, 0, 0, 6, 6);
      fill(#e1d8a3);
      triangle(1230, 698, 1257, 670, 1230, 670);
      textSize(50);
      textAlign(CENTER);
      fill(#B85644);
      text("RULES", 1085, 600);
    }
    else{
      rect(1085, 485, 370, 430, 6);
      strokeWeight(2);
      stroke(#e1d8a3);
      line(900, 485, 1270, 485);
      fill(#e1d8a3);
      triangle(1230, 698, 1257, 670, 1230, 670);
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
      circle(1010, 400, 50);
      fill(#ED7D3A);
      circle(1080, 400, 50);
      fill(139, 208, 169);
      circle(1150, 400, 50);
      textAlign(CENTER);
      fill(ruleText);
      textSize(18);
      text("Harvard", 1010, 460);
      text("MIT", 1080, 460);
      text("Greendale", 1160, 460);
      textSize(22);
      text("Use buttons to determine college. \n Follow standards as set by your \n supervisor's mood (see next page).\n \n Repeated failure to follow these \n guidelines will result in disadulations.", 1083, 520);  
      textAlign(LEFT);      
      textSize(18);
      text("Click to receive application", 1010, 350);
  }

  void rulesSecondPage(Standards s){
    textAlign(LEFT);
    textSize(25);
    text("Guidelines for Admission", 915, 305);
    textSize(18);
    text("Your supervisor is currently in a " + s.getMoodString() + " mood.", 915, 330);
    text(" - GPA must be greater than or equal to " + s.getReqGPA(), 915, 360);
    text(" - SAT must be greater than or equal to " + s.getReqSAT(), 915, 380);
    text(" - Must have at least three valid and \n   constructive extracurriculars", 915, 400);
    text(" - Statement of purpose must be free of spelling \n   errors", 915, 440);
    text("In the case of an error-free application, \n students with a liberal arts focus are admitted \n to Harvard University. Students with a STEM \n focus are admitted to MIT. Otherwise, the \n student should be admitted to Greendale. \n\nNOTE: Decisions made are irreversible. Once \n decision is made, press new application button.", 915, 515);
  }

  void update(){
    if (state == 2){
      if (mouseX < 1260 && mouseX > 910 && mouseY > 315 && mouseY < 330){
        standard.showMoodText();
      }
    }
  }

}
