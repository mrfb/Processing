boolean imageverbose = true;
boolean deployed = false;
String outputnamebase = "output";
String extension = ".png";

Flock flock;
Palette boidPalette;

int timeLimit;
boolean done = false;

void setup(){
  size(300,300);
  colorMode(HSB, 1);
  imageMode(CENTER);
  rectMode(RADIUS);
  noStroke();
  
  Palette tempA = new Palette (5);
  Palette tempB = new Palette (5);
  boidPalette = new Palette(tempA, tempB);
  
  flock = new Flock();

  // Add an initial set of boids into the system
  int numBoids = (int) width / 4;
  flock.addBoid(new Boid(random(width), random(height), color(0,0,0,.1), 2.0) );
  flock.addBoid(new Boid(random(width), random(height), color(0,0,0,.1), 1.0) );
  flock.addBoid(new Boid(random(width), random(height), color(0,0,0,.1), 1.0) );
  flock.addBoid(new Boid(random(width), random(height), color(0,0,0,.1), 0.5) );
  flock.addBoid(new Boid(random(width), random(height), color(0,0,0,.1), 0.5) );
  
  //for (int i = 0; i < numBoids; i++) {
  //  flock.addBoid(new Boid(random(width), random(height), color(.5) ));
  //}
}     

void draw(){
  //background(1);
  resetMatrix();
  flock.run();
}

String pick(String[] array){
  return array[(int)random(array.length)];
}

int pick(int[] array){
  return array[(int)random(array.length)];
}
