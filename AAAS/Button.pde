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
  boolean moody = false;
  //boolean appExists;
  //boolean decMade = false;
  
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
    if (name.equals("rage")){
      circleColor = color(#000000);
      circleHighlight = color(#303030);
      cirX = 1070; cirY = 180;
      size = 120;
      type = "rage";
      moody = true;
    }
    if (name.equals("confetti")){
      circleColor = color(#000000);
      circleHighlight = color(#303030);
      cirX = 1070; cirY = 180;
      size = 120;
      type = "confetti";
      moody = true;
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
  
  String getType(){
    return type;
  }

  void display(){
    
    noStroke();
    if (circleOver){
      fill(circleHighlight);
    }
    else{
      fill(circleColor);
    }
    
    if (!moody || standard.getMood() != 0){ // if normal kind of button OR the mood is bad/good 
      ellipse(cirX, cirY, size, size);
    }
    
    if (hovering()){
      if (type.equals("harvard")){
        textSize(64);
        textAlign(CENTER, CENTER);
        fill(#FFFFFF);
        text("H", cirX, cirY);
      }
      if (type.equals("mit")){
        textSize(64);
        textAlign(CENTER, CENTER);
        fill(#FFFFFF);
        text("M", cirX, cirY);
      }
      if (type.equals("greendale")){
        textSize(64);
        textAlign(CENTER, CENTER);
        fill(#ffffff);
        text("G", cirX, cirY);
      }
      if (moody && standard.getMood() != 0){
        textSize(64);
        textAlign(CENTER, CENTER);
        fill(#ffffff);
        text("?", cirX, cirY);
      }
    }
    
    
    
  }
  
  void update(){
    if (hovering()){
      circleOver = true;
    }
    else {circleOver = false;}
    if (clicked && type.equals("newApp")){
      app.display();
    }
  }

  boolean hovering(){
    float disX = cirX - mouseX;
    float disY = cirY - mouseY;
    return (sqrt(sq(disX) + sq(disY)) < size/2);  
  }
  
  void click(Application currentApp){
    clicked = true;
    if (type.equals("newApp") && ! appMade){
      rules = new Rulebook();
      app = new Application(rules);
      appMade = true;
      //app.toggleApp(true);
    }
    else{
      app = currentApp;
    }
    fill(0, 0, 0);
    if (type.equals("harvard")){
        app.update("Harvard");
        decMade = true;
        compare(app, type);
    }
    if (type.equals("mit")){
        app.update("MIT");
        decMade = true;
        compare(app, type);
    }
    if (type.equals("greendale")){
        app.update("Greendale");
        decMade = true;
        compare(app, type);
    }
    
    if (type.equals("rage")){
      raging = true;
    }
    
  }


}
