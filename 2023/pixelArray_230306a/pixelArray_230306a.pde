//tuning variables
int numCircles = 100;
color[] palette = {#FC00FC, #27418E, #C1F5A8, #FFFFFF, #000000, #FFFF00};
float diffusionSpeed = 10;

// Declare + Allocate
float[] xPositions = new float[numCircles];
float[] yPositions = new float[numCircles];
color[] colors = new color[numCircles];

void setup(){
  size(1000, 1000);
  noStroke();
  background(255);
  
  // Initialize via loop
  for(int i = 0; i < numCircles; i++){
    xPositions[i] = width / 2;
    yPositions[i] = height / 2;
    
    color c1, c2;
    c1 = palette[int(random(palette.length))];
    do{
      c2 = palette[int(random(palette.length))];
    }while(c1 == c2);
    
    colors[i] = lerpColor(c1, c2, random(0.1, 0.9));
  }
}

void draw(){
  // Usage
  for(int i = 0; i < numCircles; i++){
    // draw
    fill(colors[i]);
    circle(xPositions[i], yPositions[i], 50);
    // update/change positions
    xPositions[i] += random(-diffusionSpeed, diffusionSpeed);
    yPositions[i] += random(-diffusionSpeed, diffusionSpeed);
  }
  
}
