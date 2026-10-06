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
boolean wrap = false;
float lineWidth = 4;
float spawnDensity = random(0.2);

// Used to constrain the angles which snoids can accelerate in
// method used is TAU / angleConstraint
// e.g. 8 for 45 degree angles only
float angleConstraint = 8;

// Probably don't need to tune these.
boolean printCheck = false;
float checkDistance = lineWidth * 0.8;  // how far ahead the snoids check for collisions
color paper, ink;
Flock flock;
int timeout = 0;



void setup(){
  //seed = 6518745506095562752L;
  println("seed: " + seed);
  randomSeed(seed);
  //size(2048,1024);
  fullScreen();
  colorMode(HSB, 1.0);
  ellipseMode(CENTER);
  strokeJoin(ROUND);
  strokeCap(PROJECT);
  paper = color(0.2, 0.05, 1.0);
  ink = #050000;
  background(paper);
  stroke(ink);
  strokeWeight(lineWidth);
  smooth(2);
  
  
  // experiment
  lineBoids = int(random(3, 50));
  centerBoids = 0;
  noiseBoids = 0;
  circleBoids = 0;
  
  PVector center = new PVector(width/2, height/2);
  float circleRadius = random(width/2);
  float deadZoneRadius = random(0, circleRadius);
  println("spawn circle disc: " + deadZoneRadius + " through " + circleRadius);
  
  println("circle: " + circleBoids + 
          " | center: " + centerBoids + 
          " | noise: " + noiseBoids + 
          " | line: " + lineBoids);
  
  println("coh: " + rCohesion + 
          " | sep: " + rSeparation + 
          " | ali: " + rAlignment);
  
  println("speed: " + lineSpeed + 
          " | dexterity: " + lineDexterity);
          
  println("spawnDensity: " + spawnDensity);
  
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
  PVector p1 = new PVector (width * 0.0, height * 0.0);
  PVector p2 = new PVector (width * 0.0, height * 1.0);
  for (int i = 1; i <= lineBoids + 1; i++) {
    lerp = (float)i / (float)(lineBoids + 2);
    spawnPoint.set(lerp(p1.x, p2.x, lerp), lerp(p1.y, p2.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, 0));
  }
  
}

void draw(){
  flock.run();
  
  if(flock.boids.isEmpty()){
    timeout++;
  } else {
    timeout = 0;
  }
  
  if(timeout > 0){
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
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
