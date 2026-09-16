/**
 * boidpaint
 * modified from Daniel Shiffman's boid example
 */

Flock flock;
Palette clusterBoidPalette, randBoidPalette, shapePalette, squarePalette;
int timeLimit;

void setup() {
  size(666, 666);
  colorMode(HSB, 1.0);
  noStroke();
  
  // use the last output as our starting point to paint over
  image(loadImage("output.png"), 0, 0);
  
  clusterBoidPalette = new Palette(16);
  randBoidPalette = new Palette(4);
  shapePalette = new Palette(8);
  squarePalette = new Palette(8);
  
  flock = new Flock();
  timeLimit = 100 + (int)random(200);
  
  int numBoids = 50 + (int)random(300);
  int clusterBoids = (int)random(numBoids);
  int randBoids = numBoids - clusterBoids;
  
  // Add an initial set of boids into the system
  for (int i = 0; i < clusterBoids; i++) {
    flock.addBoid(new Boid(width/2, height/2, clusterBoidPalette.getColor()));
  }
  for (int i = 0; i < randBoids; i++) {
    flock.addBoid(new Boid(random(width), random(height), randBoidPalette.getColor()));
  }
}

void draw() {
  if(frameCount > timeLimit){
    // We're done. Save the image and quit.
    save("output.png");
    exit();
  }
  
  if(random(1) < .5){
    fill(shapePalette.getColor());
    int rad = (int)random(75);
    ellipse(random(width), random(height), rad, rad);
  } else {
    fill(squarePalette.getColor());
    rotate(random(TAU));
    rect(random(width), random(height), random(100), random(100));
    resetMatrix();
  }
  
  flock.run();
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY, randBoidPalette.c[0]));
}