// Snurtle Spirograph
float steeringSpeed;
float steerDamp = 0.001;
float driveSpeed = random(1.99) + .01;
float turtleSize = random(8.0) + 2.0;
color lineColor;
color bgColor;

PVector turtle;
float theta = random(TAU);  // face the turtle in a random direction

void setup(){
  size(666,666);
  colorMode(HSB, 1.0);
  lineColor = color(0,0,0,.4);
  bgColor = color(0,0,1,1);
  background(bgColor);
  noStroke();
  fill(lineColor);
  turtle = new PVector(width/2, height/2);
}

void wrapScreen(){
  turtle.x %= width;
  turtle.y %= height;
}

void draw(){
  wrapScreen();
  float e = noise(turtle.x, turtle.y) * 2 - 1; // e: [-1, 1]
  steeringSpeed = e * steerDamp * turtle.dist(new PVector(width/2, height/2));
  rotate(theta);
  translate(turtle.x, turtle.y);
  rect(turtle.x - turtleSize * .5, turtle.y + turtleSize * .5, turtleSize, turtleSize);
  
  theta += steeringSpeed;
  turtle.x += cos(theta) * driveSpeed;
  turtle.y += sin(theta) * driveSpeed;
}
