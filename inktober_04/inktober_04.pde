/*
 * Inktober 2018
 * Matthew R.F. Balousek (@mrfb)
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
  
  
  
  flock = new Flock();
  
  // BOIDS IN A CIRCLE IN THE MIDDLE
  PVector spawn = new PVector(width/2, height/2);
  for (int i = 0; i < circleBoids; i++) {
    spawn.set(width/2, height/2);
    //flock.addBoid(new Boid(random(0, width),random(0, height)));
    spawn.add(PVector.random2D().setMag(random (circleMin, circleMax)));
    flock.addBoid(new Boid(spawn.x, spawn.y));
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
  
}

void draw(){
  if(showResist) image(resist,0,0);
  
  flock.run();
  
  if(drip && frameCount % dripDelay == 0){
    flock.addBoid(new Boid(random(0, width),random(0, height)));
  }
  
  if(frameCount > 200){
    spawnDensity = 0.4;
    cAlignment *= 1.1;
    lineSpeed = 4.0;
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
