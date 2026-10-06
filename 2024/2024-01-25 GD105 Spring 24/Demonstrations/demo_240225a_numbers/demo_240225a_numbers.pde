PVector dot;
color col;

void setup(){
  size(1024, 1024);
  dot = new PVector();
  
  rectMode(CORNERS);
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(#ffffff);
  
  // update position
  dot.set(mouseX, mouseY); // equivalent to dot.x = mouseX and dot.y = mouseY
  
  // set the constraints of the color picker
  float leftWall, rightWall, topWall, bottomWall;
  leftWall = width * 0.10;
  rightWall = width * 0.50;
  dot.x = constrain(mouseX, leftWall, rightWall);
  topWall = height * 0.10;
  bottomWall = height * 0.90;
  dot.y = constrain(mouseY, topWall, bottomWall);
  
  // pick the color of the square
  float brightness = map(dot.y, bottomWall, topWall, 0, 100);
  float hue = map(dot.x, leftWall, rightWall, 0, 360);
  col = color(hue, 100, brightness);
  fill(col);
  rect(leftWall, topWall, rightWall, bottomWall);
  
  // draw the hue slider
  PVector hueA = new PVector(width * 0.60, height * 0.20);
  PVector hueB = new PVector(width * 0.90, height * 0.10);
  line(hueA.x, hueA.y, hueB.x, hueB.y);
  text("hue: " + hue, hueA.x, hueA.y + 20);
  float hueSlider = map(hue, 0, 360, 0.0, 1.0);
  float hueSliderX = lerp(hueA.x, hueB.x, hueSlider);
  float hueSliderY = lerp(hueA.y, hueB.y, hueSlider);
  circle(hueSliderX, hueSliderY, 18);
  
  // draw the brightness slider
  PVector brightnessA = new PVector(width * 0.60, height * 0.26);
  PVector brightnessB = new PVector(width * 0.90, height * 0.16);
  line(brightnessA.x, brightnessA.y, brightnessB.x, brightnessB.y);
  text("brightness: " + brightness, brightnessA.x, brightnessA.y + 20);
  float brightnessSlider = map(brightness, 0, 100, 0.0, 1.0);
  float brightnessSliderX = lerp(brightnessA.x, brightnessB.x, brightnessSlider);
  float brightnessSliderY = lerp(brightnessA.y, brightnessB.y, brightnessSlider);
  circle(brightnessSliderX, brightnessSliderY, 18);
  
  // draw the dot
  fill(#ffffff);
  circle(dot.x, dot.y, 50);
}

void mouseClicked(){
  println("\nmouse: (" + mouseX + ", " + mouseY + ")");
  println("dot: (" + dot.x + ", " + dot.y + ")");
  println("col: #" + hex(col));
}
