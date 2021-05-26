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

Jasmine:
5/24/21 - 5/25/21
During class (5/24), I completed the Standards class with the necessary instance variables, constructor, and get methods. I then worked on the word bank arrays with Nour. On (5/25), I began to work on the Executor class (Java version), creating instance variables, constructor, and most of the methods, including the compare(), showRules(), and printApplication() methods. Towards the end I've run into a small problem with day() and am considering getting rid of it and combining it with the main method to make user input easier. (But that's a problem for tomorrow!) After this, I'll test to make sure our proof of concept/basic game works and then take on the greater beast of implementing it in Processing.
