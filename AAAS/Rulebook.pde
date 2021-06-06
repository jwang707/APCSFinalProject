public class Rulebook{
  int state = 0; // 0 for closed, 1 for page 1 (basic tut), 2 for specific rules
  Standards standard;
  color ruleText = color(#BB9663);

  
  Rulebook(){
    standard = new Standards();
  }
  
  Standards getStandards(){
    return standard;
  }
  
  void display(){
    fill(#f5f2e0);
    if (state == 0){
      rect(1075, 590, 350, 215, 0, 0, 6, 6);
      fill(#e1d8a3);
      triangle(1220, 698, 1247, 670, 1220, 670);
      textSize(32);
      textAlign(CENTER);
      fill(ruleText);
      text("RULES", 1075, 697);
      
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
        textAlign(LEFT);
        textSize(25);
        text("How To Use Your Station", 915, 305);
        fill(#99FFE7); // new app color
        noStroke();
        circle(955, 350, 50);
        fill(ruleText);
        textSize(18);
        text("Click for New Application", 1000, 350);
      }
    }  
  }

  void click(Standards s){
    if (mouseY > 666 && mouseY < 700 && mouseX > 1210 && mouseX < 1250){
      state++;
      if (state == 3){
        state = 0;
      }
    }
  }




}
