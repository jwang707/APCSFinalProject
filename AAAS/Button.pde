public class Button{ // used https://processing.org/examples/button.html for help
  int cirX, cirY; // x and y pos
  int size = 90; // diameter
  color circleColor, baseColor;
  color currentColor;
  color circleHighlight;
  boolean circleOver = false;
  
  Button(String name){ // consturctor
    ellipseMode(CENTER);
    if (name.equals("harvard")){ // harvard button!
      circleColor = color(164, 16, 52);
      circleHighlight = color(77, 8, 25);
      cirX = 970; cirY = 60; 
    }
  }
  
  Button(){ // uhh don't need this i think
    ellipseMode(CENTER);
    circleColor = color(255);
    circleHighlight = color(130);
    cirX = 500; cirY = 500; 
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
    if (hovering(cirX, cirY, size)){
      circleOver = true;
    }
    else {circleOver = false;}
  }

  boolean hovering(int x, int y, int diameter){
    float disX = x - mouseX;
    float disY = y - mouseY;
    return (sqrt(sq(disX) + sq(disY)) < diameter/2);
  }

}
