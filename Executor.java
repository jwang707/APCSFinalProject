import java.util.*;

public class Executor{
  private int errorsMade, decisionsMade, dailyBenchmark, disads, numApps, numDay, errorThreshold;
  String[] acceptanceLetter = {"We are overjoyed to inform you of your acceptance to ", "Hey, congrats, you got into ",
  "As expected, you got into ", "Is this even a surprise? You got into ", "For the next four years, you will be attending ",
  "Get excited, because you’ve been accepted to ", "Let’s just get it over with. Welcome to ", "Ring the alarm bells! You got into ",
  "Our sincerest condolences, but the only school we could fit you in was (drumroll, please...): ",
  "I hope you like college, because you’re going to "};
  // TOTAL COUNT: 10, for now!

  public Executor(){
    errorsMade = 0;
    decisionsMade = 0;
    dailyBenchmark = 5;
    disads = 0;
    numApps = 7;
    numDay = 0;
    errorThreshold = 3;
  }

  public void introduction(){
    System.out.println("It is the year 2050. There are three options for higher education past high school in the United States: Harvard, MIT, and Greendale Community College. The admissions process has been streamlined. Applicants submit one document with their grades, intended major, extracurriculars, and statement of purpose. You are the inspector. Follow the guidelines for admission. Make Harvard and MIT proud.");
    // will be more complicated when implemented in processing!
  }

  public void compare(Application app, String userDecision){ // this will be rewritten once we're in processing!
    int intDecision = -1;
    String decision = userDecision.toLowerCase();

    if (decision.contains("harvard")){ // decision making will be replaced by BUTTONS in processing
      intDecision = 1;
    }
    if (decision.contains("greendale")){
      intDecision = 0;
    }
    if (decision.contains("mit")){
      intDecision = 2;
    }

    //catches bad user input in which they try to submit multiple colleges to cheat the system... nice try.
    if ((decision.contains("harvard") && decision.contains("mit")) ||
        (decision.contains("harvard") && decision.contains("greendale")) ||
        (decision.contains("mit") && decision.contains("greendale")))
        {
          intDecision = -1;
        }

    if (intDecision == -1){ // catches bad user input, technically unnecessary but i like dissing people
      System.out.println("How can you call yourself an admissions officer when you can't even choose correctly?");
      errorMade(); // runs failure
    }else  if (intDecision == app.getCollege()){
      printAcceptance(intDecision);
    }
    else{
      errorMade();
    }
  }

  public String printAcceptance(int school){ // more complex in processing yada yada
    int letterPicker = (int) (Math.random()*10);
    String accLetter = acceptanceLetter[letterPicker];
    if (school == 0){
      accLetter += "Greendale..?";
    }
    if (school == 1){
      accLetter += "Harvard!";
    }
    if (school == 2){
      accLetter += "MIT!";
    }
    return accLetter;
  }

  public void showRules(Standards standard){ // will be slightly more complex in processing
    System.out.println("Hello, officer. The rules for today are as follows: \n \n GPA >= " + standard.getReqGPA(); + "\n SAT >= " + standard.getReqSAT() + "\n At least 3 valid extracurriculars. \n A statement of purpose without spelling errors.");
  }

  public void showApp(Application app){
    System.out.println("APPLICATION #" + decisionsMade + "\n ID: " + (int) (Math.random() * 99999999) + "\n GPA: " + app.getGPA() + "\n SAT: " + app.getSAT() + "\n Extracurriculars: \n" + app.getECs(); + "\n Statement of Purpose: " + app.getStatement());
  }

  public void errorMade(){
    errorsMade++;
    System.out.println("You did a bad job. Be sad. You now have " + errorsMade + " mistakes. Make three mistakes and get a disadulation!");
    if (errorsMade == 3){
      disads++;
      System.out.println("Tut tut. You've made three mistakes. That's a disadulation! You now have " + disads + " disadulations. Three disadulations and you're fired!");
    }
    if (disads == 3){
      gameOver();
    }
  }

  public void gameOver(){ // will be more complex in processing (like a fadey screen or whatveer, more dramatic)
    System.out.println("Three strikes and you're out! You're FIRED!");
  }

  public void endOfDay(){
    System.out.println("Congrats! You reached your daily quota. Go home and get some rest before coming back tomorrow to ruin more people's lives!");
    errorsMade = 0;
    numDay++;
    numApps += 2;
    if (numDay % 3 == 0){
      errorThreshold--;
      System.out.println("You've been doing pretty well. I, the supervisor, have decided to be stricter with your disadulations. Now, if you make " + errorThreshold + "mistakes, you will receive a disadulation!");
    }
  }

  public void day(){
    System.out.println("Good morning! Time for you to get to work.");

    for (int i = 0; i < numApps; i++){
      // should run through an application, still need to figure out how to get user input????

    }

  }

}
