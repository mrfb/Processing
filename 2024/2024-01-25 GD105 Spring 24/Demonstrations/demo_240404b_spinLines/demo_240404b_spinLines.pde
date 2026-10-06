// little layered drawing piece
// each frame, draw a black line and a white line
// change the parameters of the lines a bit each frame
// in a random walk style

int numLines = 9;
wanderLine[] lines;

void setup(){
  size(900, 900);
  background(255);
  noSmooth();
  strokeWeight(1);
  
  lines = new wanderLine[numLines];
  
  PVector tempLoc = new PVector();
  // alternate between black and white lines
  for(int i = 0; i < lines.length; i++){
    tempLoc.set(i / 3 * 300 + 150, i % 3 * 300 + 150);
    lines[i] = new wanderLine(tempLoc, color(i%2==0?0:0, 5));
    noFill();
    square(i / 3 * 300 + 25, i % 3 * 300 + 25, 250);
  }
  
}

void draw(){
  
  for(int i = 0; i < lines.length; i++){
    lines[i].drawLine();
    lines[i].updateLine();
  }
}

class wanderLine{
  PVector home;
  float lineLength, lineJitter;
  float radius, radiusJitter;
  float angle, angleJitter;
  color ink;
  
  wanderLine(PVector loc, color col){
    home = new PVector(loc.x, loc.y);
    lineLength = random(-width*.2, width*.2);
    radius = random(-width*.1, width*.1);
    angle = random(TAU);
    ink = col;
    
    lineJitter = random(1, 5);
    radiusJitter = random(2, 5);
    angleJitter = random(TAU * 0.005);
  }
  
  void drawLine(){
    resetMatrix();
    translate(home.x, home.y);
    rotate(angle);
    stroke(ink);
    line(radius, -lineLength/2, radius, lineLength/2);
  }
  
  void updateLine(){
    // random walk line parameters
    lineLength += random(-lineJitter, lineJitter);
    radius += random(-radiusJitter, radiusJitter);
    angle += random(-angleJitter, angleJitter);
    
    // limit line length and radius
    lineLength = constrain(lineLength, -width*.9, width*.9);
    radius = constrain(radius, -width*.1, width*.1);
    
    //ink = color(frameCount%2==0?0:255, 5);
  }
}

void mouseClicked(){
  String time = "" + year() + "-" + month() + "-" + day()
             + "-" + hour() + "-" + minute() + "-" + second();
  save("output/" + time + ".png");
  println("saved as " + time + ".png");
}
