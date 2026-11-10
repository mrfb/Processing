float angleA, angleB;
String startTime;

void setup() {
  size(1000, 1000);
  background(#ffffff);
  
  startTime = year() + "-" + month() + "-" + day() + "_"
           + hour() + "-" + minute() + "-" + second();
}

void draw() {
  translate(width/2, height/2);
  float rotationSpeed = TAU / 300;
  float oscillationSpeed = 0.01;
  int angleOffset = 10;

  angleA = frameCount * rotationSpeed;
  angleB = (frameCount + angleOffset) * rotationSpeed;

  float radius = sin(frameCount * oscillationSpeed) * 450;

  stroke(#000000);
  line(cos(angleA) * radius, sin(angleA) * radius,
       cos(angleB) * radius, sin(angleB) * radius);

  //noStroke();
  //fill(#aa0000, 50);
  //circle(cos(angleA) * radius, sin(angleA) * radius, 50);
  //fill(#00aa00, 50);
  //circle(cos(angleB) * radius, sin(angleB) * radius, 50);
}

void mouseClicked(){
  // for filenames... big to small makes it easier to see how you
  // progressed over time if you're saving a lot of stuff
  String filename = startTime + "_frame" + frameCount + ".png";
  save(filename);
  println("saved as " + filename);
}
