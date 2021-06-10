public class Acceptance{
  private String[] acceptanceLetter = {"We are overjoyed to inform you of your acceptance to ", "Hey, congrats, you got into ",
  "As expected, you got into ", "Is this even a surprise? You got into ", "For the next four years, you will be attending ",
  "Get excited, because you’ve been accepted to ", "Let’s just get it over with. Welcome to ", "Ring the alarm bells! You got into ",
  "Our sincerest condolences, but the only school we could fit you in was (drumroll, please...): ",
  "I hope you like college, because you’re going to "};
  String letter;
  boolean clicked = false;
  
  //constructor
  Acceptance(Application app){
    int letterPicker = (int) (Math.random()*10);
    letter = acceptanceLetter[letterPicker];
    
    if (app.getCollege() == 0){
      letter += "Greendale..?";
    }
    if (app.getCollege() == 1){
      letter += "Harvard!";
    }
    if (app.getCollege() == 2){
      letter += "MIT!";
    }
  }
  
  void display(){
      noStroke();
      fill(#f5f2e0);
      rect(612.5, 160, 350, 170, 7);
      textSize(32);
      fill(#B85644);
      text(letter, 612.5, 150, 320, 100);
  }

}
