// Lines anchor at the center and wander over the canvas over time.

// might want to refactor a bit to constrain them to a radius
// by constraining the magnitude and adding a transform so the
// start is always at (0, 0);

Line[] lines;

void setup(){
  size(800, 800);
  noSmooth();
  
  lines = new Line[250];
  for(int i = 0; i < lines.length; i++){
    lines[i] = new Line(width/2, height/2, random(width), random(height));
  }
  
  lines[0].stroke = color(0);
  background(255);
}

void draw(){
  for(int i = 0; i < lines.length; i++){
    lines[i].display();
    lines[i].update();
  }
  
  noStroke();
  fill(255);
  circle(width/2, height/2, 50);
}

void mouseClicked(){
  save("output.png");
  println("saved sample as output.png");
}
