int numParticles = 1000;

color paper = #ffffff;

float turniness = 3.5;

// declarations
color[] inks;
float[] xs, ys, speeds, sizes;

int start = 300;
int duration = 600;

void setup(){
  size(854, 480);
  background(paper);
  noStroke();
  
  // allocate
  inks = new color[numParticles];
  xs = new float[numParticles];
  ys = new float[numParticles];
  speeds = new float[numParticles];
  sizes = new float[numParticles];
  
  // initialization
  for(int i = 0; i < numParticles; i++){
    inks[i] = color(random(255),
                    random(255),
                    random(255), 4);
    xs[i] = random(width);
    ys[i] = random(height);
    sizes[i] = random(1, width);
    
    speeds[i] = width / sizes[i];
  }
}

void draw(){
  //background(paper);
  
  for(int i = 0; i < numParticles; i++){
    // draw the ith circle
    fill(inks[i]);
    circle(xs[i], ys[i], sizes[i]);
    
    // update the ith circle's position
    
    float noise = noise(xs[i] * .01, ys[i] * .01, frameCount * .1);
    float theta = noise * TAU * turniness;
    
    float velX = speeds[i] * cos(theta);
    float velY = speeds[i] * sin(theta);
    
    xs[i] += velX;
    ys[i] += velY;
    
    // check for collisions
    boolean tooFarLeft = xs[i] + sizes[i]*.5 < 0;
    boolean tooFarRight = xs[i] - sizes[i]*.5 > width;
    boolean tooFarUp = ys[i] + sizes[i]*.5 < 0;
    boolean tooFarDown = ys[i] - sizes[i]*.5 > height;
    
    if(tooFarLeft){
      xs[i] += width + sizes[i];
    }
    
    if(tooFarRight){
      xs[i] -= width+ sizes[i];
    }
    
    if(tooFarUp){
      ys[i] += height+ sizes[i];
    }
    
    if(tooFarDown){
      ys[i] -= height+ sizes[i];
    }
  }
  if(frameCount >= start && frameCount < start + duration){
      saveFrame("frames/####.png");
      println("saved " + frameCount);
  }
}
