public class Standards{
  private double reqGPA;
  private int reqSAT, currMood;
  color ruleText = color(#B85644);
  int moodTextNum;
  
  String[][] moodText = {
    {"Your supervisor tripped over their shoelaces.", "Your supervisor got dumped.", "Your supervisor stepped in gum...", "Your supervisor's kid got suspended from school.", 
    "Your supervisor was clawed by their cat.", "Your supervisor's train was late by an hour.", "Your supervisor was attacked by a squirrel.", "Your supervisor's Starbucks order was wrong.",
    "Your supervisor's daughter was admitted to Greendale.", "Your supervisor put their pants on backwards.", "Your supervisor is wearing mismatching socks.", "Your supervisor has food stuck in their teeth",
    "Your supervisor's ice cream was eaten by their children last night.", "Your supervisor just went through an intervention for their gambling problem.", "Your supervisor is having an existential crisis.",
    "Your supervisor just watched Bo Burnham's 'Inside'.", "Your supervisor listened to 'Threnody to the Victims of Hiroshima.'", "Your supervisor is having a bad hair day.", "Your supervisor is being supervised.",
    "Your supervisor lost money playing poker.", "Your supervisor lost money at the casino.", "Your supervisor has a chronic gambling addiction."}, // bad mood text
    
    {"Your supervisor found $100 on the street.", "Your supervisor appears to have found love.", "Honestly, they've just decided to be happy.", "Your supervisor is wearing his lucky tie.",
    "Your supervisor just had a great meal.", "Your supervisor won $200 in the lotto! (No bonus for you)", "Your supervisor looks great today.", "There's a substitute supervisor on duty.",
    "Your supervisor won money at the casino last night.", "Your supervisor's USB plugged in the right way the first time.", "Your supervisor watched John Mulaney.", "Your supervisor is humming 'Caramelldansen.'",
    "Your supervisor's kid got an 100 on their APCS project (wink)."} // good mood text
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
