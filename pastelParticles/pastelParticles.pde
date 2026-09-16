int numParticles = 1000;

color paper = #ffffff;

float turniness = 1.5;

// declarations
color[] inks;
float[] xs, ys, speeds, sizes;

void setup(){
  size(666, 666);
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
    inks[i] = color(random(180, 255),
                    random(180, 255),
                    random(150, 200), 20);
    xs[i] = width * .50;
    ys[i] = height * .50;
    sizes[i] = random(20, 100);
    
    speeds[i] = 100 / sizes[i];
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
    boolean tooFarLeft = xs[i] < 0;
    boolean tooFarRight = xs[i] > width;
    boolean tooFarUp = ys[i] < 0;
    boolean tooFarDown = ys[i] > height;
    
    if(tooFarLeft){
      xs[i] += width;
    }
    
    if(tooFarRight){
      xs[i] -= width;
    }
    
    if(tooFarUp){
      ys[i] += height;
    }
    
    if(tooFarDown){
      ys[i] -= height;
    }
    
  }
}
