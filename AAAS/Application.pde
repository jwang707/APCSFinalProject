import java.util.*;
import java.io.*;

public class Application{

//Application Variables
  String intendedMajor, statement;
  double gpa;
  int sat;
  String[] ECs = new String[3];
  int college;
  String error;
  int ID = (int) (Math.random() * 99999999);
  Standards stand = new Standards();
  String decision = "...";
  boolean appToggled = false;
  Rulebook rules;

//Word Banks
  //index of arrays: 0 = greendale, 1 = harvard, 2 = mit
  String[][] intendedMajors = {

    {"Air Conditioning Repair", "Napping", "Circus Training", "Clownery",
    "Academic Dishonesty", "Fish Training", "Surfing", "Gaming", "Astrology",
    "Costumes", "Theft", "Tomfoolery", "Moran", "Pun Creation", "Propaganda Journalism",
    "Grifting", "Vandalism", "Ladders", "Paintball", "The Physics of Slapping"},
    //TOTAL COUNT: 20

    {"History", "Liberal Arts", "Anthropology", "Literature", "Education", "English",
    "Gender Studies", "Spanish", "French", "Italian", "Art History",
    "Arts, Film, and Visual Studies", "Classics", "Comparative Literature",
    "East Asian Studies", "Folklore and Mythology", "Germanic Languages and Literatures",
    "History of Art and Architecture", "Linguistics", "Music",
    "Near Eastern Language and Civilizations", "Philosophy", "Theater, Dance, and Media",
    "Psychology", "Ethics"},
    //TOTAL COUNT: 25

    {"Computer Science", "Mathematics", "Engineering", "Biological Engineering",
    "Civil Engineering", "Environmental Engineering", "Aerospace Engineering",
    "Chemical Engineering", "Finance", "Technology", "Physics", "Electrical Engineering",
    "Molecular Biology", "Microbiology", "Genetics"}
    //TOTAL COUNT: 15

  };

  String[][] extraCurriculars = {
    {"Napping", "League of Legends", "Brushed hair", "TikTok user", "Champion nose blower",
    "Watermelon Slapper Club", "Professional mug user", "Chronic Reddit user",
    "Discord moderator", "What is extracurricular?", "Professional simp",
    "My mom said I am smart", "Eating candy", "Wasting money", "Netflix binger", "Weeb",
    "Puppy kicker", "Animal costume wearer", "Zombie", "Professional bad singer",
    "Lettuce Eating Club", "Chronic iPhone buyer", "Pencil-breaking Club", "Clownery Club",
    "Finger Licking Club", "Mr. K give us 100 pls", "Chronically Late Club", "Ruiners Club",
    "Fake Wikipedia Page Club", "Texting Club", "Bribery Club",
    "American Idol Audience Member", "UWU Club", "Professional Pillow Fluffer",
    "Professional Pillow Fighter", "Liberal Destroyer", "Twitter Troll", "Chocolate Eater",
    "Sleeping Club", "Whining Club", "Procrastination Club", "Screaming Club",
    "Off-Key Singers Club", "Immaturity Club", "Poking Club", "Shopping Club",
    "Pig Latin Club", "Meowing Club", "Fake Club to Look Good For College",
    "Rick Singer Fan Club"},
    //TOTAL COUNT: 50

    {"Volunteering at Library", "Delivered humanitarian aid", "Wrote bestselling novels",
    "Performed in Broadway musicals", "Lead chorus singer", "Won prestigious art competitions",
    "Award winning journalist", "Law internship", "Established world peace",
    "Can play 40 different instruments", "Ended homelessness", "Student newspaper editor",
    "Won an Oscar", "Starred in the latest Star Wars movie", "Founded Classics Club",
    "Unlocked the Rosetta Stone", "Created a new worldwide language", "Culture Club President",
    "National debate champion", "Organized a charity fundraiser", "Ended WWIII",
    "Psychology Research Internship", "National Historical Honor Society",
    "New York Times Guest Writer", "Grammy Nominee", "Emmy Winner", "Writer for The Office",
    "Linguistics Club", "Part of an Internationally Recognized Acapella Group",
    "Won the X-Factor", "National Spelling Bee Winner", "Political Internship",
    "Opera singer at the MET", "Performed violin at Carnegie Hall", "History Tutor",
    "Started a writing tutoring service", "Invented a new art style", "World famous artist",
    "Started an organization that saved the sea turtles", "Published poet",
    "Wrote the lyrics to three Grammy-winning songs", "Won Nobel Peace Prize",
    "Organized climate rally", "Policy advisor for NYS governor",
    "Volunteers to teach kids how to read", "Animal Shelter Volunteer",
    "Wrote a 200 page paper on the meaning of life",
    "Philosophy internship with Socrates’s distant relative", "Designed a skyscraper",
    "Designed Blake Lively’s outfit for the MET gala"},
    //TOTAL COUNT: 50

    {"CSdojo Senpai", "Cured cancer (every kind)", "Computer science internship",
    "Won USACO gold", "Launched a rocket to Pluto", "NASA internship",
    "Created a new molecule", "Solved the Riemann hypothesis", "Legalized division by zero",
    "Robotics President", "Ended climate change", "Created excellent APCS project ;)",
    "Astronomy Club President", "Discovered time travel", "Cured COVID-20",
    "Discovered a new gene", "Cured a genetic disease",
    "Discovered a new periodic table element", "Discovered alien life", "Discovered a dinosaur",
    "Published an award-winning research paper", "Science Olympiad",
    "Invented a new, more efficient wheel", "CEO of Tesla", "Internship at Apple",
    "Internship at Google", "Fixed a black hole",
    "Used my CS skills to take down election hackers", "Won Nobel Prize in my major",
    "Created a robotic penguin", "Interned at a startup", "Invented a new CS language",
    "Wrote the APCS exam", "Wrote problems for the AIME",
    "Part-time math teacher at my high school", "Invented a new branch of mathematics",
    "Improved Einstein’s Theory of Relativity", "Won prestigious engineering competition",
    "CS Internship at Netflix", "Designed the i-Phone 100", "Math Team",
    "Discovered a new shape", "Part-time astronaut", "Chemistry Club President",
    "Physics Club President", "Organized a Hackathon", "Microsoft Internship",
    "Won the Congressional App Challenge", "Won the International Olympiad in Informatics",
    "Invented a new form of renewable energy"}
    //TOTAL COUNT: 50

  };

  String[] Statements = {"I want prestige.", "I like studying!",
  "I have dedicated my life to my major.", "I love what I do in my life!",
  "This is the first step to a greater life.", "I am very intelligent!",
  "As long as this isn’t misspelled, I can get into any college.",
  "Please don’t send me to Greendale.", "My life is suffering.",
  "Please wait for the host to start this meeting.", "This is proof of my intelligence.",
  "I am just a set of code in this object in a class.", "This statement is meaningless.",
  "I’m so excited for college! It only gets better!",
  "I think I deserve to go to a good college.", "I went to Stuyvesant High School. Let me in.",
  "I’m very passionate about my major.", "I am destined for greatness!",
  "This is a generic statement about my life!",
  "My life has been hard. Let me into your college.", "Does anyone even read these?",
  "You are getting sleepy. Now approve my application.",
  "You look good today! Approve my application.", "This is a rare message. Is it?",
  "I suffered for four years. Let me suffer for four more.", "I am a legacy student.",
  "My daddy donated a new building.",
  "College is spelled with two ‘l’s. Please don’t give me another.",
  "Roses are red, violets are blue. If you are kind, you’ll let me through.",
  "If you let me in, I’ll give you a cookie."};
  //TOTAL COUNT: 30


  String[] errorList = {"gpa", "sat", "IM", "EC", "statement"};


  Application(){
    statement = Statements[(int)(Math.random()*30)];
    college = (int)(Math.random()*3);
    error = "none";

  //  Standards stand = new Standards();
    double minGPA = stand.getReqGPA();
    int minSAT = stand.getReqSAT();

    //default good sat and GPA
    gpa = Math.round((Math.random()*(100 - minGPA) + minGPA)*10);
    gpa = gpa / 10.0;
    sat = ((int)(Math.random()*(1601 - minSAT)) + minSAT) /10 *10;


    if (college == 2){
      //MIT
      intendedMajor = intendedMajors[2][(int)(Math.random()*15)];

      int first = (int)(Math.random()*20); //within index 0-19 for extracurriculars
      int second = (int)(Math.random()*15) + 20; //from index 20 - 34 for extracurriculars
      int third = (int)(Math.random()*15) + 35; //from index 35 - 49 for extracurriculars

      ECs[0] = extraCurriculars[2][first];
      ECs[1] = extraCurriculars[2][second];
      ECs[2] = extraCurriculars[2][third];

    }else if(college == 1){
      //harvard
      intendedMajor = intendedMajors[1][(int)(Math.random()*25)];

      int first = (int)(Math.random()*20); //within index 0-19 for extracurriculars
      int second = (int)(Math.random()*15) + 20; //from index 20 - 34 for extracurriculars
      int third = (int)(Math.random()*15) + 35; //from index 35 - 49 for extracurriculars

      ECs[0] = extraCurriculars[1][first];
      ECs[1] = extraCurriculars[1][second];
      ECs[2] = extraCurriculars[1][third];

    }else{
      //greendale
      error = errorList[(int)(Math.random()*5)];

      //generic good application stuff that will change in the "errors"
      //gpa and sat are already set

      int rand = (int)(Math.random()*2)+1;

      if (rand == 1){
        intendedMajor = intendedMajors[rand][(int)(Math.random()*25)];
      }else{
        intendedMajor = intendedMajors[rand][(int)(Math.random()*15)];
      }

      int first = (int)(Math.random()*20); //within index 0-19 for extracurriculars
      int second = (int)(Math.random()*15) + 20; //from index 20 - 34 for extracurriculars
      int third = (int)(Math.random()*15) + 35; //from index 35 - 49 for extracurriculars

      ECs[0] = extraCurriculars[rand][first];
      ECs[1] = extraCurriculars[rand][second];
      ECs[2] = extraCurriculars[rand][third];


      if (error.equals("gpa")){

        gpa = Math.round((Math.random()*(minGPA - 40) + 40) *10);
        gpa = gpa / 10.0;

      }else if (error.equals("sat")){

        sat = (int)(Math.random()*minSAT) /10 *10;

      }else if (error.equals("IM")){

        intendedMajor = intendedMajors[0][(int)(Math.random()*20)];

      }else if (error.equals("EC")){

        int random = (int)(Math.random()*3);
        ECs[random] = extraCurriculars[0][(int)(Math.random()*50)];

      }else{    //error is statement

        String str = "";
        int randCharFirst = (int)(Math.random()*5);
        int randCharSecond = (int)(Math.random()*(statement.length()-6))+5;
        str+=statement.substring(0, randCharFirst);

        char firstMistake = statement.charAt(randCharFirst);
        firstMistake ++;
        str += firstMistake;

        str += statement.substring(randCharFirst+1, randCharSecond);

        char secondMistake = statement.charAt(randCharSecond);
        secondMistake ++;
        str += secondMistake;
        str += statement.substring(randCharSecond+1);

        statement = str;

      }

    }

  }

 String getMajor(){
    return intendedMajor;
  }

  double getGPA(){
    return gpa;
  }

  String getStatement(){
    return statement;

  }

  int getSAT(){
    return sat;
  }

  String[] getECs(){
    return ECs;
  }

  int getCollege(){
    return college;
  }

  String getError(){
    return error;
  }

  Standards getStand(){
    return stand;
  }

  String getECsString(){
    String str = " ";

    for (int i = 0; i<3; i++){
      str+= "• ";
      str+=ECs[i];
      if (i < 2){
        str+="\n "; // \t isn't supported? weird.
      }
    }

    return str;
  }
  
  void update(String school){
     decision = school; 
  }
  
  void toggleApp(boolean toggle){
    appToggled = toggle;
  }

  boolean getToggleApp(){
    return appToggled;
  }

  
  void display(){
    textSize(32);
    fill(255, 255, 255);
    noStroke();
    rect(460, 375, 700, 650, 7);
    fill(0, 0, 0);
    textAlign(LEFT);
    text("ID: " +  ID, 150, 120);
    textSize(25);
    text("GPA: " + gpa, 200, 200);
    text("SAT: " + sat, 200, 250);
    text("Intended Major: " + intendedMajor, 200, 300);
    text("Extracurriculars:", 200, 350);
    text(getECsString(), 200, 380);
    text("Statement: ", 200, 480);
    text(statement, 525, 564.5, 400, 200);
    text("Decision: " + decision, 200, 600);
  }
  

}
