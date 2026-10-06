int numCircles = 10;

// declaration
int[] sizes;
float[] orbits;
float[] animationSpeeds;
float[] offsets;
color[] colors;
PVector[] circles;

void setup() {
  size(1024, 1024);
  noStroke();
  
  // allocate
  sizes = new int[numCircles];
  orbits = new float[numCircles];
  animationSpeeds = new float[numCircles];
  offsets = new float[numCircles];
  colors = new color[numCircles];
  circles = new PVector[numCircles];
  
  // initialize
  // i will have values from 0 to 9
  // which matches the indices of our array
  for(int i = 0; i < numCircles; i++){
    sizes[i] = (int)random(100, 250);
    orbits[i] = 250 - sizes[i];
    animationSpeeds[i] = random(0.01, 0.1);
    offsets[i] = random(TAU);
    colors[i] = color(random(150), random(150), random(150));
    circles[i] = new PVector( random(width) , random(height) );
  }
}

void draw() {
  background(#ffffff);
  
  // using the arrays
  for(int i = 0; i < numCircles; i++){
    fill(colors[i]);
    circle(circles[i].x + cos(frameCount * animationSpeeds[i] + offsets[i]) * orbits[i],
           circles[i].y + sin(frameCount * animationSpeeds[i] + offsets[i]) * orbits[i], 
           sizes[i]);
  }
  
}
