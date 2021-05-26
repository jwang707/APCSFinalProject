import java.util.*;
import java.io.*;

public class Application{


//Application Variables
  private String studentName, intendedMajor, statement;
  private double gpa;
  private int sat;
  private String[] ECs;
  private int college;

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


  public Application(){
    statement = Statements[(int)(Math.random()*30)];
    college = (int)(Math.random()*3);

    Standards stand = new Standards();
    double minGPA = stand.getReqGPA();
    int minSAT = stand.getReqSAT();

//HARVARD AND MIT

    if (college > 0){
      gpa = Math.round((Math.random()*(100 - minGPA) + minGPA)*10) / 10.0;
      sat = ((int)(Math.random()*(1600 - minSAT)) + minSAT) /10 *10;

      //MIT
      if (college == 2){
        intendedMajor = intendedMajors[2][(int)(Math.random()*15)];

      }else if(college == 1){
        //harvard
        intendedMajor = intendedMajors[1][(int)(Math.random()*25)];
      }

    }else{
      //greendale
      String error = errorList[(int)(Math.random()*5)];

//String[] errorList = {"gpa", "sat", "IM", "EC", "statement"};

      if (error.equals("gpa")){
        //error
        gpa = Math.round(Math.random()*minGPA*10) / 10.0;

        //everything else good
        sat = ((int)(Math.random()*(1600 - minSAT)) + minSAT) /10 *10;

        int rand = (int)(Math.random()*2)+1;
        if (rand == 1){
          intendedMajor = intendedMajors[rand][(int)(Math.random()*25)];
        }else{
          intendedMajor = intendedMajors[rand][(int)(Math.random()*15)];
        }
        //use rand for ecs as well

      }else if (error.equals("sat")){
        //error
        sat = (int)(Math.random()*minSAT) /10 *10;

        //everything else good
        gpa = Math.round((Math.random()*(100 - minGPA) + minGPA)*10) / 10.0;

        int rand = (int)(Math.random()*2)+1;
        if (rand == 1){
          intendedMajor = intendedMajors[rand][(int)(Math.random()*25)];
        }else{
          intendedMajor = intendedMajors[rand][(int)(Math.random()*15)];
        }



      }else if (error.equals("IM")){
        //error
        intendedMajor = intendedMajors[0][(int)(Math.random()*20)];

        //everything else good
        gpa = Math.round((Math.random()*(100 - minGPA) + minGPA)*10) / 10.0;
        sat = ((int)(Math.random()*(1600 - minSAT)) + minSAT) /10 *10;

      }else if (error.equals("EC")){

        //everything else good
        gpa = Math.round((Math.random()*(100 - minGPA) + minGPA)*10) / 10.0;
        sat = ((int)(Math.random()*(1600 - minSAT)) + minSAT) /10 *10;

        int rand = (int)(Math.random()*2)+1;
        if (rand == 1){
          intendedMajor = intendedMajors[rand][(int)(Math.random()*25)];
        }else{
          intendedMajor = intendedMajors[rand][(int)(Math.random()*15)];
        }

      }else{
        //error is statement


        //everything else good
        gpa = Math.round((Math.random()*(100 - minGPA) + minGPA)*10) / 10.0;
        sat = ((int)(Math.random()*(1600 - minSAT)) + minSAT) /10 *10;

        int rand = (int)(Math.random()*2)+1;
        if (rand == 1){
          intendedMajor = intendedMajors[rand][(int)(Math.random()*25)];
        }else{
          intendedMajor = intendedMajors[rand][(int)(Math.random()*15)];
        }
      }

    }

  }


  public static void main(String[] args){
    Application app = new Application();

  /*  System.out.println("NEW APPLICATION");

    System.out.println();

    System.out.println("COLLEGE");

    System.out.println(app.college);
    if (app.college == 1){
      System.out.println("Harvard");
    }else if(app.college == 2){
      System.out.println("MIT");
    }else if(app.college == 0){
      System.out.println("Greendale");
    }else{
      System.out.println("Uh oh there's a problem");
    }

    System.out.println();
    System.out.println("INFO");
    System.out.println("Personal Statement: " + app.statement);
    System.out.println("GPA: " + app.gpa);
    System.out.println("SAT: " + app.sat);

    */
  }


}
