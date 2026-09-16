/*
 * Inktober 2018
 * Matthew R.F. Balousek (@mrfb)
 */
 
color paper, ink;
Flock flock;
int timeout = 0;
PGraphics resist;

void setup(){
  randomSeed(seed);
  //size(1337,666);
  size(4000, 4600);
  //fullScreen();
  
  resist = createGraphics(width,height);
  drawResist();
  
  colorMode(HSB, 1.0);
  ellipseMode(CENTER);
  strokeCap(PROJECT);
  
  paper = color(0.2, 0.05, 1.0);
  ink = #050000;
  
  // for printing, do in B/W and then make a mask later
  paper = color(1); // for printing
  ink = color(0);
  
  background(paper);
  noFill();
  stroke(ink);
  strokeWeight(lineWidth);
  smooth(8);
  
  if(additive){
    image(loadImage(filename), 0, 0);
  }
  
  flock = new Flock();
  
  if(showResist) image(resist,0,0);
  
  spawnBoids();
}

void draw(){
  flock.run();
  
  if(killFrame > 0 && frameCount >= killFrame){
    flock.boids.clear();
  }
  
  if(drip && frameCount % dripDelay == 0){
    spawnDrip();
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
  
  shifts();
}
