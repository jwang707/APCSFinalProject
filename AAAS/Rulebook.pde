public class Rulebook{
  int state = 0; // 0 for closed, 1 for page 1 (basic tut), 2 for specific rules
  Standards standard;
  
  Rulebook(){
    standard = new Standards();
  }
  
  Standards getStandards(){
    return standard;
  }
  
  void display(){
    fill(#f5f2e0);
    rect(1075, 485, 350, 430, 6);
    strokeWeight(2);
    stroke(#e1d8a3);
    line(900, 485, 1250, 484);
    text("heehoo", 310, 1075);
  }

  void click(Standards s){
    
  }




}
