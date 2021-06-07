public class Standards{
  private double reqGPA;
  private int reqSAT, currMood;

  public Standards(){
    reqGPA = 94.0;
    reqSAT = 1550;


    currMood = (int) (Math.random()*3)-1; // random -1, 0, or 1


    if (currMood == -1){
      reqGPA += 2;
      reqSAT += 20;
    }
    if (currMood == 1){
      reqGPA -= 1;
      reqSAT -= 20;
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


}
