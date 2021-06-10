public class Error{
  
  //constructor
  Error(){
  }
  
  void display(){
      noStroke();
      fill(#FFA0A0);
      rect(612.5, 160, 350, 170, 7);
      textSize(20);
      textAlign(CENTER, CENTER);
      fill(#B85644);
      text(errorMsg, 612.5, 140, 320, 150);
      textSize(16);
      textAlign(CENTER, CENTER);
      fill(#B85644);
      text("\nClick on this sticker to continue.", 612.5, 220, 320, 100);
  }

}
