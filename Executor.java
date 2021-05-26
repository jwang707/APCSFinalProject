public class Executor{
  private int errorsMade, decisionsMade, dailyBenchmark, disads, numApps, numDay;

  public Executor(){
    errorsMade = 0;
    decisionsMade = 0;
    dailyBenchmark = 5;
    disads = 0;
    numApps = 7;
    numDay = 0;
  }

  public void introduction(){
    System.out.println("It is the year 2050. There are three options for higher education past high school in the United States: Harvard, MIT, and Greendale Community College. The admissions process has been streamlined. Applicants submit one document with their grades, extracurriculars, intended major, and statement of purpose. You are the inspector. Follow the guidelines for admission. Make Harvard and MIT proud.");
    // will be more complicated when implemented in processing!
  }

  public void compare(Application app, String userDecision){ // this will be rewritten once we're in processing!
    int userDecision = -1;
    String decision = userDecision.toLowerCase();

    if (decision.contains("harvard")){
      userDecision = 1;
    }
    if (decision.contains("greendale")){
      userDecision = 0;
    }
    if (decision.contains("mit"))){
      userDecision = 2;
    }

    if (userDecision == -1){ // catches bad user input, technically unnecessary but i like dissing people
      System.out.println("How can you call yourself an admissions officer when you can't even choose correctly?")
      errorMade(); // runs failure
      return;
    }
    if (userDecision == app.getCollege()){
      printAcceptance(userDecision);
      return;
    }
    else{
      errorMade();
      return;
    }
  }

  public String printAcceptance(int school){
    String acceptanceLetter = "";

  }



}
