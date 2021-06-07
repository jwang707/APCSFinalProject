public class Button{ // used https://processing.org/examples/button.html for help
  int cirX, cirY; // x and y pos
  int size = 90; // diameter
  color circleColor, baseColor;
  color currentColor;
  color circleHighlight;
  boolean circleOver = false;
  String type;
  boolean clicked;
  Application app;
  boolean appExists;
  
  Button(String name){ // constructor
    ellipseMode(CENTER);
    if (name.equals("harvard")){ // harvard button!
      circleColor = color(164, 16, 52);
      circleHighlight = color(77, 8, 25);
      cirX = 970; cirY = 60; 
      type = "harvard";
    }
    if (name.equals("newAppButton")){
        circleColor = color(#99FFE7);
      circleHighlight = color(#5CFFD9);
      cirX = 50; cirY = 350; 
      type = "newApp";
    }
    if (name.equals("mit")){
      circleColor = color(#ED7D3A);
      circleHighlight = color(#CD5713);
      cirX = 1070; cirY = 60; 
      type = "mit";
    }
    if (name.equals("greendale")){
      circleColor = color(139, 208, 169);
      circleHighlight = color(81, 184, 126);
      cirX = 1170; cirY = 60; 
      type = "greendale";
    }
  }
  
  Button(){ // uhh don't need this i think
    ellipseMode(CENTER);
    circleColor = color(255);
    circleHighlight = color(130);
    cirX = 500; cirY = 500; 
  }
  
  Application getApp(){
    return app;
  }

  void display(){
    noStroke();
    if (circleOver){
      fill(circleHighlight);
    }
    else{
      fill(circleColor);
    }
    ellipse(cirX, cirY, size, size);
  }
  
  void update(){
    if (hovering()){
      circleOver = true;
    }
    else {circleOver = false;}
    if (clicked && type.equals("newApp")){
      app.display();
      appExists = true;
    }
  }

  boolean hovering(){
    float disX = cirX - mouseX;
    float disY = cirY - mouseY;
    return (sqrt(sq(disX) + sq(disY)) < size/2);
  }
  
  void click(Application currentApp){ /*
    if (appExists){
      text("true", 800, 650);
    }
    else{text("false", 800, 700);}
    */ // broken as for now
    
    clicked = true;
    if (type.equals("newApp")){
      app = new Application();
      //app.toggleApp(true); 
    }
    else{
      app = currentApp;
    }
    fill(0, 0, 0); // MINOR ISSUE HERE; if a button is pressed without an app being generated, it causes a null pointer exception
    if (type.equals("harvard")){
        app.update("Harvard"); // problem here
    }  
    if (type.equals("mit")){
        app.update("MIT");
    }  
    if (type.equals("greendale")){
        app.update("Greendale");
    }  
  }


}
