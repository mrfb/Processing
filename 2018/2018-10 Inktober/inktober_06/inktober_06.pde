/*
 * Inktober 2018
 * Matthew R.F. Balousek (@mrfb)
 */
 
 /*
  1st wall: 24 lines from the center;
  2nd wall: 12 lines from the midpoint of each of the sides;
  3rd wall: 12 lines from each corner;
  4th wall: 24 lines from the center,
            12 lines from the midpoint of each of the sides,
            12 lines from each corner.
 */
 
 

color paper, ink;
Flock flock;
int timeout = 0;
PGraphics resist;

void printVariables(){
  println("seed: " + seed);
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
}

void setup(){
  randomSeed(seed);
  //size(1337,666);
  //size(2048, 1024);
  fullScreen();
  
  resist = createGraphics(width,height);
  drawResist();
  
  colorMode(HSB, 1.0);
  ellipseMode(CENTER);
  strokeCap(PROJECT);
  
  paper = color(0.2, 0.05, 1.0);
  ink = #050000;
  
  background(paper);
  noFill();
  stroke(ink);
  strokeWeight(lineWidth);
  smooth(8);
  
  if(additive){
    image(loadImage(filename), 0, 0);
  }
  
  flock = new Flock();
  
  // BOIDS IN A CIRCLE IN THE MIDDLE
  PVector spawn = new PVector(width/2, height/2);
  for (int i = 0; i < circleBoids; i++) {
    spawn.set(width/2, height/2);
    //flock.addBoid(new Boid(random(0, width),random(0, height)));
    spawn.add(PVector.fromAngle(i * TAU / circleBoids).setMag(random (circleMin, circleMax)));
    flock.addBoid(new Boid(spawn.x, spawn.y, i * TAU / circleBoids + TAU*.35));
  }
  
  // RANDOMLY PLACED BOIDS
  for (int i = 0; i < noiseBoids; i++) {
    flock.addBoid(new Boid(random(0, width),random(0, height)));
  }
  
  // BOIDS IN THE VERY CENTER
  for (int i = 0; i < centerBoids; i++) {
    flock.addBoid(new Boid(width/2, height/2));
  }
  
  // BOIDS ALONG A LINE
  float lerp;
  PVector spawnPoint = new PVector();
  PVector p1 = new PVector (0, 0);
  PVector p2 = new PVector (width, height);
  for (int i = 0; i < lineBoids; i++) {
    lerp = (float)i / (float)lineBoids;
    spawnPoint.set(lerp(p1.x, p2.x, lerp), lerp(p1.y, p2.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y));
  }
  
  // BOIDS IN EACH OF THE CORNERS
  for (int i = 0; i < cornerBoids; i++) {
    flock.addBoid(new Boid(0, 0, random(TAU*0.75, TAU*1.00)));
    flock.addBoid(new Boid(width, 0, random(TAU*0.50, TAU*0.75)));
    flock.addBoid(new Boid(0, height, random(TAU*0.0, TAU*0.25)));
    flock.addBoid(new Boid(width, height, random(TAU*0.25, TAU*0.50)));
  }
  
  // BOIDS IN EACH OF THE EDGE MIDPOINTS
  for (int i = 0; i < midpointBoids; i++) {
    flock.addBoid(new Boid(width/2, 0, random(TAU*0.50, TAU*1.00)));
    flock.addBoid(new Boid(width, height/2, random(TAU*0.25, TAU*0.75)));
    flock.addBoid(new Boid(width/2, height, random(TAU*0.0, TAU*0.50)));
    flock.addBoid(new Boid(0, height/2, random(TAU*0.75, TAU*1.25)));
  }
  
  // BOIDS IN THE CORNER
  if(leafBoid){
    PVector dir = new PVector(width, -height);
    dir.normalize();
    Boid leaf = new Boid(width * .1, height * .9);
    leaf.velocity = dir.setMag(lineSpeed * 3);
    flock.addBoid(leaf);
  }
  
}

void draw(){
  if(showResist) image(resist,0,0);
  
  flock.run();
  
  if(drip && frameCount % dripDelay == 0){
    flock.addBoid(new Boid(random(0, width),random(0, height)));
  }
  
  if(frameCount > killFrame * .5){
    // timing switches
  }
  
  if(killFrame > 0 && frameCount >= killFrame){
    flock.boids.clear();
  }
  
  if(flock.boids.isEmpty()){
    timeout++;
  } else {
    timeout = 0;
  }
  
  if(timeout > hangTime){
    println("drawing finished, saved as " + filename);
    save(filename);
    exit();
  }
}
