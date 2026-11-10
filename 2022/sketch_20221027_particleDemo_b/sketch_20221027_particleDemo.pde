// declare and initialize
int numParticles = 100;

float particleSpeed = 50;

// declare
float[] x, y, velX, velY, size;
color[] col;

void setup() {
  size(666, 666);
  //frameRate(1);
  
  // arrays need a middle step: instantiation
  x = new float[numParticles];
  y = new float[numParticles];
  velX = new float[numParticles];
  velY = new float[numParticles];
  size = new float[numParticles];
  col = new color[numParticles];

  // initialize
  float direction;
  for (int i = 0; i < numParticles; i++) {
    // let our particles go offscreen
    //x[i] = random(-width, width);
    //y[i] = random(-height, height);
    
    //x[i] = 0;
    //y[i] = 0;
    
    x[i] = random(-width * .2, width * .2);
    y[i] = random(-height * .2, height * .2);
    
    direction = random(TAU);
    size[i] = random(5, 50);
    velX[i] = cos(direction) * particleSpeed/size[i];
    velY[i] = sin(direction) * particleSpeed/size[i];
    col[i] = color(random(120,255),
                   random(120,255),
                   random(120,255),
                   25);
  }

  // overwrite our first particle's
  // color to find it easier
  col[0] = #000000;

  // inspect our particle's variables
  println("x[0]: " + x[0]);
  println("y[0]: " + y[0]);
  println("size[0]: " + size[0]);
  println("velX[0]: " + velX[0]);
  println("velY[0]: " + velY[0]);
  println("col[0]: " + hex(col[0]));

  noStroke();
  background(255);
}

void draw() {
  //fill(255, 10);
  //rect(0, 0, width, height);
  //background(255);
  
  translate(width/2, height/2);
  
  // draw the particles
  for (int i = 0; i < numParticles; i++) {
    fill(col[i]);
    circle(x[i], y[i], size[i]);
  }

  // update the particles
  for (int i = 0; i < numParticles; i++) {
    if (x[i] < -width*.5) velX[i] *= -1;
    if (x[i] > width*.5) velX[i] *= -1;
    if (y[i] < -height*.5) velY[i] *= -1;
    if (y[i] > height*.5) velY[i] *= -1;

    //float direction = noise(x[i] * .01, y[i] * .01, frameCount * 1) * TAU * 3;

    //velX[i] = cos(direction) * particleSpeed/size[i];
    //velY[i] = sin(direction) * particleSpeed/size[i];

    x[i] += velX[i];
    y[i] += velY[i];
  }
}
