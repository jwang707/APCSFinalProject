# APCSFinalProject
Absolutely Accurate Admissions Simulator
1. BoredOfAdmissions
2. Jasmine Wang and Charlotte (Nour) Kastoun
3. A game similar to <i> Papers, Please </i> where you (the user) play the part of an admissions officer to determine whether a student gets into Harvard, MIT, or Greendale Community College. The difficulty can be scaled depending on how much time we have but at the most basic level, you’ll receive the student’s GPA, SAT score, extracurriculars, intended major, and statement of purpose (which will be one sentence long). The user must compare this information to the rules and use that to determine what school the student will attend. This project will be done in Java first, but hopefully end up in Processing if we have the time to add visual features.

Proposal: https://docs.google.com/document/d/1oyPPoz8RnCR7FU4K3PSLNvjDRoJHhUrLgNEBKkHn8nk/edit?usp=sharing

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
