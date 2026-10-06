/*
 * 2018 October 01 — Inktober
 * Playing with boids as pens.
 * If a boid touches another line, it ends.
 */

String filename = "output.png";
long seed = (long)(random(1) * 9223372036854775807L);

int circleBoids = random(1)>.5 ? int(random(300)) : 0;
int centerBoids = random(1)>.5 ? int(random(30)) : 0;
int noiseBoids =  random(1)>.5 ? int(random(2000)) : 0;
int lineBoids = random(1)>.5 ? int(random(300)) : 0;
boolean wrap = random(1) > .5;
float lineWidth = 4;

// Probably don't need to tune these.
boolean printCheck = false;
float checkDistance = 0.7;  // how far ahead the snoids check for collisions
color paper, ink;
Flock flock;




void setup(){
  //seed = 6518745506095562752L;
  println("seed: " + seed);
  randomSeed(seed);
  size(1024,512);
  //fullScreen();
  colorMode(HSB, 1.0);
  ellipseMode(CENTER);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  paper = color(0.2, 0.05, 1.0);
  ink = #050000;
  background(paper);
  stroke(ink);
  strokeWeight(lineWidth);
  smooth(2);
  
  if(centerBoids + noiseBoids + circleBoids + lineBoids == 0){
    lineBoids = (int)random(100,3000);
  }
  
  //// experiment
  //lineBoids = round(random(10, 300));
  //centerBoids = 0;
  //noiseBoids = 0;
  //circleBoids = 0;
  
  PVector center = new PVector(width/2, height/2);
  float circleRadius = random(width/2);
  float deadZoneRadius = random(0, circleRadius);
  println("spawn circle disc: " + deadZoneRadius + " through " + circleRadius);
  
  println("circle: " + circleBoids + 
          " | center: " + centerBoids + 
          " | noise: " + noiseBoids + 
          " | line: " + lineBoids);
  
  PVector spawn = center.copy();
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < circleBoids; i++) {
    spawn.set(width/2, height/2);
    //flock.addBoid(new Boid(random(0, width),random(0, height)));
    spawn.add(PVector.random2D().setMag(random (deadZoneRadius, circleRadius)));
    flock.addBoid(new Boid(spawn.x, spawn.y));
  }
  
  for (int i = 0; i < noiseBoids; i++) {
    flock.addBoid(new Boid(random(0, width),random(0, height)));
  }
  
  for (int i = 0; i < centerBoids; i++) {
    flock.addBoid(new Boid(width/2, height/2));
  }
  
  float lerp;
  PVector spawnPoint = new PVector();
  PVector p1 = new PVector (random(width), random(height));
  PVector p2 = new PVector (random(width), random(height));
  for (int i = 0; i < lineBoids; i++) {
    lerp = (float)i / (float)lineBoids;
    spawnPoint.set(lerp(p1.x, p2.x, lerp), lerp(p1.y, p2.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y));
  }
  
}

void draw(){
  strokeWeight(lineWidth);
  flock.run();
  
  if(flock.boids.isEmpty()){
    println("drawing finished, saved as " + filename);
    save(filename);
    exit();
  }
}


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

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
