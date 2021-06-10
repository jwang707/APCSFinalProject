public class Standards{
  private double reqGPA;
  private int reqSAT, currMood;
  color ruleText = color(#B85644);
  int moodTextNum;
  
  String[][] moodText = {
    {"Your supervisor tripped over their shoelaces.", "Your supervisor got dumped.", "Your supervisor stepped in gum...", "Your supervisor's kid got suspended from school."}, // bad mood text
    {"Your supervisor found $100 on the street.", "Your supervisor appears to have found love.", "Honestly, they've just decided to be happy."} // good mood text
  };

  public Standards(){
    reqGPA = 94.0;
    reqSAT = 1550;

    currMood = (int) (Math.random()*3)-1; // random -1, 0, or 1

    if (currMood == -1){
      reqGPA += 2;
      reqSAT += 20;
      int capacity = moodText[0].length;
      moodTextNum = (int)(Math.random()*capacity);
    }
    if (currMood == 1){
      reqGPA -= 1;
      reqSAT -= 20;
      int capacity = moodText[1].length;
      moodTextNum = (int)(Math.random()*capacity);
    }
  }

  public double getReqGPA(){
  //  System.out.println(currMood);
    return reqGPA;
  }

  public int getReqSAT(){
    return reqSAT;
  }

  public int getMood(){
    return currMood;
  }

  public String getMoodString(){
    if (currMood == -1){
      return "bad";
    }
    if (currMood == 0){
      return "neutral";
    }
    if (currMood == 1){
      return "good";
    }else{
      //this shouldn't happen but it's here to catch if it does
      return "broke";
    }
  }
  
  void showMoodText(){
        fill(#f5b48f);
        textSize(22);
        noStroke();
        if (getMood() == -1){ // bad mood
          String flavor = moodText[0][moodTextNum];
          rectMode(CORNERS);
          rect(mouseX-(flavor.length()*9)-20, mouseY-30, mouseX, mouseY);
          fill(ruleText);
          textAlign(RIGHT, BOTTOM);
          text(moodText[0][moodTextNum], mouseX, mouseY);
         }
        if (getMood() == 1){ // good mood
          String flavor = moodText[1][moodTextNum];
          rectMode(CORNERS);
          rect(mouseX-(flavor.length()*9)-20, mouseY-30, mouseX, mouseY, 4);
          fill(ruleText);
          textAlign(RIGHT, BOTTOM);
          text(moodText[1][moodTextNum], mouseX, mouseY);
        }
  }


}
