// variable declaration
// we can have one or multiple declarations on one line
float left;
float center, right, top, middle, bottom;

PVector target, position;

void setup() {
  // code that runs once at the beginning
  // of the program goes in here
  size(1000, 1000);

  stroke(#000000, 5); // 5/255 opacity black

  background(#ffffff);
  
  // initialization
  left = width * 0.25;
  center = width * 0.50;
  right = width * 0.75;
  
  top = height * 0.25;
  middle = height * 0.50;
  bottom = height * 0.75;
  
  /* since left/center/etc use width and height which
     isn't decided until size() is called, they can't
     be initialized on the lines they're declared on
     
     this is a multi-line comment, btw.
     */
}

void draw() {
  // code that runs once each frame
  // goes in here
  
  // declaration and initialization on the same line
  float speed = .01;
  float radius = 250;
  
  //// declaration
  float targetX;
  // initialization
  targetX = cos(frameCount * speed) * radius + center;
  float targetY;
  targetY = sin(frameCount * speed) * radius + middle;
  
  // println can slow down our program,
  // so if we don't need to monitor stuff,
  // it's good to "turn it off" by commenting it out
  //println("target: (" + targetX + ", " + targetY + ")");
  
  
  // draw lines from each point on our 3x3 grid
  // to the current target
  
  // top row
  line(left, top, targetX, targetY);
  line(center, top, targetX, targetY);
  line(right, top, targetX, targetY);
  
  // middle row
  line(left, middle, targetX, targetY);
  line(center, middle, targetX, targetY);
  line(right, middle, targetX, targetY);
  
  // bottom row
  line(left, bottom, targetX, targetY);
  line(center, bottom, targetX, targetY);
  line(right, bottom, targetX, targetY);
}

void mouseClicked() {
  // code that runs when the mouse is pressed
  // and then released goes here
  save("output.png");
  println(frameCount + ": saved as output.png");
}

void keyPressed() {
  println("key pressed! wiping the slate clean");
  background(#ffffff);
}
