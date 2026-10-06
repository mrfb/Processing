/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */

String outputName = "coooooolbirds.png";

Flock flock;

// this chunk does stuff when the program begins
void setup() {
  size(666, 666);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
  
  //background(255);
  rectMode(CORNER);
  noStroke(); // turn off the white border outside the shape
}

// this runs once per frame
void draw() {
  fill(1,1,1,10);
  rect(0, 0, width, height);
  flock.run();
  
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}

void keyPressed() {
  save(outputName);
  exit();
}
