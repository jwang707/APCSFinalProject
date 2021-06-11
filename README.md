# APCSFinalProject
Absolutely Accurate Admissions Simulator
1. BoredOfAdmissions
2. Jasmine Wang and Charlotte (Nour) Kastoun
3. A game similar to <i> Papers, Please </i> where you (the user) play the part of an admissions officer to determine whether a student gets into Harvard, MIT, or Greendale Community College. The difficulty can be scaled depending on how much time we have but at the most basic level, you’ll receive the student’s GPA, SAT score, extracurriculars, intended major, and statement of purpose (which will be one sentence long). The user must compare this information to the rules and use that to determine what school the student will attend. This project will be done in Java first, but hopefully end up in Processing if we have the time to add visual features.

Proposal: https://docs.google.com/document/d/1oyPPoz8RnCR7FU4K3PSLNvjDRoJHhUrLgNEBKkHn8nk/edit?usp=sharing

COMPILE/RUN INSTRUCTIONS

• Must open + run the AAAS file in Processing in order to start the game.

GAME INSTRUCTIONS/TIPS

• Instructions for moving through applications and days are included inside the game, as are the rules of how to decide whether to send the applicant to Harvard or MIT, or to ruin their life—sorry, send them to Greendale Community College.
• Reminders:
    • Errors reset at the start of every day. Disadulations do not.
    • The number of errors left until you get a disadulation is listed in the Counter box.
    • You are stuck in this job until you get three disadulations and get fired. If you are amazingly good at this game, it will never end. 
• Tip: Make sure to check the rulebook for every application! Your supervisor is very moody, so the guidelines for admission will change frequently.
• Additional fun features that the user can discover:
   • Go to the "Guidelines for Admission" page of the rulebook. If the first statement says, "Your supervisor is currently in a [good/bad] mood," then we suggest you hover over the text for an entertaining surprise!
   • Click on the black buttons labelled "?" for another cool surprise!


DEVELOPMENT LOGS

Nour:
5.24.2021 - 5.25.2021
During class (5/24), I started working on the Application class. I wrote all the instance variables and then Jasmine and I worked on creating our word bank arrays, which I added to the class the next morning (5/25). Right now, I just finished writing most of the constructor, including the college generator, the statement generator, the gpa and sat generator based on Standards, the error generator, the faulty GPA and SAT, and the major generator for all three colleges. I also did some testing and fixed a small error in the Standards class that showed up as I was testing. I'm going to finish working on the class (extracurriculars generators for all three colleges, spelling errors in statement for greendale, and get() methods).

5.26.2021
During class, I wrote the extracurriculars generator and the random statement spelling errors generator. I also wrote all the get() methods. Later, I did some testing in the main and fixed an error with the extracurricular generator. I also wrote the toString() method for the extracurriculars list and added an instance variable Standard stand and its corresponding get() method.

5.28.2021
Before and during class, I worked on the Executor class. I fixed some compile errors, added more details to the rules and application print methods, and rewrote the errorsMade() method to be more aligned with the proposal and have the game increase in difficulty. 

5.30.2021
I finished and tested the Executor class! I wrote the day() and main methods and did a bunch of testing. I added a boolean gameOver variable to end the game when gameOver() (the method) was called. I also fixed some stuff with disadulations. I fixed A BUNCH of spelling and formatting things (very Greendalian of me to misspell "intended major"). I also edited the Application class slightly to make the bad GPAs slightly more reasonable (no more 2.6 GPAs) and made a major change such that it was possible for someone to get a 1600 on the SAT. 

6.3.2021 (Zoom call with Jasmine)
Got a lot done in Processing yay! I made the intro screen (learned how to wrap text!) and worked on formatting and generating the application from the button. 

6.9.2021 (in class with Jasmine)
Figured out how to make the the buttons not abusable (make decisions final and prevent user from generating a new application if they haven't made a decision).

6.9.2021 (after school)
Made the acceptance and rejection stickers (made Acceptance and Error classes).
Made a day runnable (unblocking the buttons once the decision is made, updating the variables, etc.).
Cleaned up the draw() method by making helpers for each screen.
Made the good morning and good night/end of day screens.
Made the game playable (run through days infinitely until the user loses).
Made a game over screen.
Basically transferred and updated/rewrote everything from Executor class in Java to Processing.
Did some testing and debugging.

6.10.2021
Debugging.
Made it so that to move on to the next application, you just have to click the generate app button, not go through the sticker etc.
Added counters that display to show things like what day it is, how many applications you have left in a day, etc.
Made SAT and GPA generators generate higher scores in order to make the changing standards/mood more relevant and the game harder.

Jasmine:
5/24/21 - 5/25/21
During class (5/24), I completed the Standards class with the necessary instance variables, constructor, and get methods. I then worked on the word bank arrays with Nour. On (5/25), I began to work on the Executor class (Java version), creating instance variables, constructor, and most of the methods, including the compare(), showRules(), and printApplication() methods. Towards the end I've run into a small problem with day() and am considering getting rid of it and combining it with the main method to make user input easier. (But that's a problem for tomorrow!) After this, I'll test to make sure our proof of concept/basic game works and then take on the greater beast of implementing it in Processing.

5/26/21-5/28/21
I started work on Processing, implementing the title screen and beginning to work on basic buttons. I still have to update the UML diagram to include Processing classes (I did not realize how many I would need!)

6/3/21 (Zoom with Nour)
Did a good chunk of work today in Processing, adding buttons including one that can create/display an application. Fiddled around with colors but I don't think it's ready to put in the demo. Also ended up making buttons functional.

6/6/21
Started adding the rulebook; made it flippable and started to detail some of the buttons.

6/9/21
Finished rulebook (fully workable with Standards), fixed around some general visual aspects, and worked on making the decisions final (once a decision is made it can't be changed)/application generator not abusable during class with Nour.
