int numCircles = 100; // try changing this!

// declaration
color[] inks;

// declaration AND creation
int[] radii = new int[numCircles];
float[] offset = new float[numCircles];

void setup(){
  size(800, 500);
  noStroke();
  
  // array usage
  inks = new color[numCircles]; // create
  // initialization
  for(int i = 0; i < numCircles; i++){
    // colors will be kinda blue, kinda green, kinda transparent
    inks[i] = color(random(0, 180), random(180, 255), random(180, 255), random(64, 192));
    radii[i] = int(random(30, 150));
    offset[i] = random(height);
    println("inks["+i+"]: #"+hex(inks[i]));
  }
  background(#ffffff);
}

void draw(){
  background(#ffffff); // try turning this off
  
  float space = float(width) / float(numCircles);
  float margin = space * .5;
  for(int i = 0; i < numCircles; i++){
    fill(inks[i]);
    circle((space*i)+margin, (frameCount+offset[i])%height, radii[i]);
  }
  
}
