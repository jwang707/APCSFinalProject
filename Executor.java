import java.util.*;

//in processing, variables like errorThreshold, errorsMade, decisionsMade, and disads will be constantly visible

public class Executor{
  private int errorsMade, decisionsMade, disads, numApps, numDay, errorThreshold;
  private boolean gameOver = false;
  private String[] acceptanceLetter = {"We are overjoyed to inform you of your acceptance to ", "Hey, congrats, you got into ",
  "As expected, you got into ", "Is this even a surprise? You got into ", "For the next four years, you will be attending ",
  "Get excited, because you’ve been accepted to ", "Let’s just get it over with. Welcome to ", "Ring the alarm bells! You got into ",
  "Our sincerest condolences, but the only school we could fit you in was (drumroll, please...): ",
  "I hope you like college, because you’re going to "};
  // TOTAL COUNT: 10, for now!

  public Executor(){
    errorsMade = 0;
    decisionsMade = 0; //total number of decisions made accross all days
  //  dailyBenchmark = 4; //number of apps that you shld get right
    disads = 0;
    numApps = 7; //number of apps in one day
    numDay = 1;
    errorThreshold = 3; //number of errors for one disadulation. threshold of 3 = 2 errors allowed. 3rd one is a disad.
  }

  public void introduction(){
    System.out.println("It is the year 2050. There are three options for higher education past high school in the United States: Harvard, MIT, and Greendale Community College. The admissions process has been streamlined. Applicants submit one document with their grades, intended major, extracurriculars, and statement of purpose. You are the Admissions Officer. Follow the guidelines for admission. Make Harvard and MIT proud.");
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
      System.out.println(printAcceptance(intDecision));
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

  public void showRules(Application app){ // will be slightly more complex in processing
    System.out.println("Here are your rules: \n • GPA >= " + app.getStand().getReqGPA() + "\n • SAT >= " + app.getStand().getReqSAT() + "\n • A valid intended major, either aligned towards STEM or Humanities." + "\n • Three valid extracurriculars. \n \t • A valid extracurricular is defined as a productive use of time and/or a standout accomplishment. \n \t • It must align with the student's STEM or Humanities focus. \n \t • All three extracurriculars must be valid. \n • A statement of purpose without spelling errors.");
    System.out.println(" • Students admitted to Harvard must have a passion for Humanities. Students admitted to MIT must have a passion for STEM. This can be determined through their intended major and extracurriculars, assuming both are valid.");
    System.out.println(" • All students with errors in their applications should be admitted to Greendale Community College.");
    System.out.println();
    System.out.println("Good luck!");
  }

  public void showApp(Application app){
    System.out.println("APPLICATION #" + (decisionsMade+1) + "\n ID: " + (int) (Math.random() * 99999999) + "\n GPA: " + app.getGPA() + "\n SAT: " + app.getSAT() + "\n Intended Major: " + app.getMajor() + "\n Extracurriculars: \n" + app.getECsString() + "\n Statement of Purpose: " + app.getStatement());
  }


  public void errorMade(){
    errorsMade++;

    if (disads == 3){
      gameOver();
    }

    else if (errorThreshold == 1 && errorsMade == errorThreshold){
      disads++;
      System.out.println("We expected perfection, but you made a mistake. No. You ARE the mistake. Do better.");

      if (disads == 1){
        System.out.println("You have received a disadulation. You now have " + disads + " disadulation. Three disadulations and you're fired!");
      }
      else if (disads == 3){
        gameOver();
      }
      else{
        System.out.println("You have received a disadulation. You now have " + disads + " disadulations. Three disadulations and you're fired!");
      }

      errorsMade = 0;
    }

    else if (errorsMade == errorThreshold){
      disads++;

      if (disads == 1){
        System.out.println("Tut tut. You've made " + errorThreshold + " mistakes. That's a disadulation! You now have " + disads + " disadulation. Three disadulations and you're fired!");
      }
      else if (disads == 3){
        gameOver();
      }
      else{
        System.out.println("Tut tut. You've made " + errorThreshold + " mistakes. That's a disadulation! You now have " + disads + " disadulations. Three disadulations and you're fired!");
      }

      errorsMade = 0;
    }

    else{
      if (errorsMade == 1){
        System.out.println("You did a bad job. Be sad. You now have " + errorsMade + " mistake.");
      }else{
        System.out.println("You did a bad job. Be sad. You now have " + errorsMade + " mistakes.");
      }

      System.out.println("This is a written warning. If you make " + errorThreshold + " mistakes today, you will receive a full disadulation.");
    }

  }

  //might want to rewrite/rework this

  public void gameOver(){ // will be more complex in processing (like a fadey screen or whatever, more dramatic)
    System.out.println();
    System.out.println("Three strikes and you're out! You're FIRED!");
    gameOver = true;
  }

  public void endOfDay(){
    System.out.println("Congrats! You reached your daily quota. Go home and get some rest before coming back tomorrow to ruin more people's lives!");
    errorsMade = 0;
    numDay++;
    numApps += 2;
    if (errorThreshold > 1 && numDay % 3 == 0){
      errorThreshold--;
      if (errorThreshold==1){
        System.out.println("You've been doing pretty well. I, the supervisor, have decided to be stricter with your disadulations. Now, we expect perfection. You will receive a disadulation as soon as you make a mistake.");
      }else{
        System.out.println("You've been doing pretty well. I, the supervisor, have decided to be stricter with your disadulations. Now, if you make " + errorThreshold + " mistakes, you will receive a disadulation!");
      }
    }
  }

  public void day(){
    System.out.println();
    System.out.println("--------------------------------------------------------------");
    System.out.println("Good morning! Time for you to get to work.");

    if (errorThreshold == 1){
      System.out.println("Today is Day " + numDay + ". You will be given " + numApps + " applications to review. You will receive a disadulation for every " + errorThreshold + " mistake you make today.");
    }else{
      System.out.println("Today is Day " + numDay + ". You will be given " + numApps + " applications to review. You will receive a disadulation for every " + errorThreshold + " mistakes you make today.");
    }

    wait(1000);

    for (int i = 0; ! gameOver && i < numApps; i++){
      System.out.println();

      //generates application
      Application app = new Application();

      //shows current mood and corresponding rules for this current application
      System.out.println("You are currently in a " + app.getStand().getMoodString() + " mood.");
      showRules(app);
      System.out.println();

      //prints application
      System.out.println();
      showApp(app);
      System.out.println();

      //user input
      Scanner sc = new Scanner(System.in);
      System.out.println("Enter your decision: ");
      String dec = sc.nextLine();
      System.out.println();

      //compare
        //that will print acceptance or call errorsMade
          //which can call gameOver
            //boolean gameOver stops the loop (in for statement)
      compare(app, dec);
      System.out.println();
      wait(3000);
      decisionsMade++;

    }
  }

  public static void wait(int ms){ // PURELY A JAVA THING!
    try
    {
        Thread.sleep(ms);
    }
    catch(InterruptedException ex)
    {
        Thread.currentThread().interrupt();
    }
}

  public static void main(String[] args){
    //loop through days, actually runs the thing
    Executor game = new Executor();

    System.out.println();
    System.out.println();
    game.introduction();

    while (! game.gameOver){
      game.day();

      if (! game.gameOver){
        wait(2000);
        game.endOfDay();
      }

    }

  }

}
