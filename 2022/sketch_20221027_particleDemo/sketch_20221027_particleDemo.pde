// declare and initialize
int numParticles = 1000;

float particleSpeed = 30;
int transparency = 20; // too low and we get bruised colors

float contrastRate = 0.5;

float noiseScaleX = .01;
float noiseScaleY = .01;
float noiseScaleTime = 0.001;
float scatter = 1 / TAU; // scales direction

int frameLimit = 10000;

// declare
float[] x, y, velX, velY, size;
color[] col;
boolean[] visible;

boolean fadeout = false;

void setup() {
  size(1000, 1000);
  //frameRate(1);
  
  // arrays need a middle step: instantiation
  x = new float[numParticles];
  y = new float[numParticles];
  velX = new float[numParticles];
  velY = new float[numParticles];
  size = new float[numParticles];
  col = new color[numParticles];
  visible = new boolean[numParticles];

  // initialize
  float direction;
  for (int i = 0; i < numParticles; i++) {
    
    // offscreen spawn
    //x[i] = random(-width, width);
    //y[i] = random(-height, height);
    
    // center spawn
    //x[i] = 0;
    //y[i] = 0;
    
    //// box cluster spawn
    //float clusterDistance = .2;
    //x[i] = random(-width * clusterDistance, width * clusterDistance);
    //y[i] = random(-height * clusterDistance, height * clusterDistance);
    
    // radial cluster spawn
    float clusterDistance = .2 * width;
    float theta = random(TAU);
    float radius = random(clusterDistance);
    x[i] = cos(theta) * radius;
    y[i] = sin(theta) * radius;
    
    direction = 0;
    visible[i] = true;
    size[i] = random(10, 100);
    velX[i] = cos(direction) * particleSpeed/size[i];
    velY[i] = sin(direction) * particleSpeed/size[i];
    
    col[i] = color(random(200,255),
                   random(150,255),
                   random(0,255),
                   transparency);
                   
    if(random(1) < contrastRate){
      col[i] = random(1)<.5 ? #000000 : #ffffff;
    } else if(random(1) < contrastRate){
      col[i] = color(random(255), random(255), random(255), transparency);
    }
  }

  noStroke();
  background(255);
}

void draw() {
  if(frameCount > frameLimit && fadeout == false){
    println("frameCount: " + frameCount);
    fadeout();
  }
  //fill(255, 10);
  //rect(0, 0, width, height);
  //background(255);
  
  // move (0, 0) to the center of the canvas
  translate(width/2, height/2);
    
  // draw the particles
  for (int i = 0; i < numParticles; i++) {
    if(visible[i] == false) continue;
    fill(col[i]);
    circle(x[i], y[i], size[i]);
  }

  // update the particles
  for (int i = 0; i < numParticles; i++) {
    
    x[i] += velX[i];
    y[i] += velY[i];
    
    // toroidal space particles
    if(fadeout){
      if (x[i] + size[i] * .5 < -width*.5) visible[i] = false;
      if (x[i] - size[i] * .5  > width*.5) visible[i] = false;
      if (y[i] + size[i] * .5  < -height*.5) visible[i] = false;
      if (y[i] - size[i] * .5  > height*.5) visible[i] = false;
    } else {
      if (x[i] + size[i] * .5 < -width*.5) x[i] += width + size[i];
      if (x[i] - size[i] * .5  > width*.5) x[i] -= width + size[i];
      if (y[i] + size[i] * .5  < -height*.5) y[i] += height + size[i];
      if (y[i] - size[i]  * .5 > height*.5) y[i] -= height + size[i];
    }

    // overwrite particle physics-y behavior with noise behavior
    float direction = noise(x[i] * noiseScaleX,
                            y[i] * noiseScaleY,
                            frameCount * noiseScaleTime) * TAU * scatter;

    velX[i] = cos(direction) * particleSpeed/size[i];
    velY[i] = sin(direction) * particleSpeed/size[i];
    
  }
}

void fadeout(){
  fadeout = true;
  println("fadeout triggered -- everyone's going home after this one");
}

void keyPressed(){
  println("key pressed");
  fadeout();
}
