/*
 * @inksnails
 * Matthew R.F. Balousek (@mrfb)
 */

// fuss with these
boolean loop = false;
boolean someSmallGames = false; // an array of small squares
boolean forPrinting = false; // sets paper to white and ink to black

// don't fuss with these
import processing.pdf.*;
color paper, ink;
Flock flock;
PGraphics resist;
int timeout = 90; // measures how long the render has been dead

void setup(){
  size(2048,2048); // general deployment
  //size(2400, 2400); //zine cover
  //size(666, 666); // worksize
  //fullScreen(); // pretty
  
  colorMode(HSB, 1.0);
  ellipseMode(CENTER);
  rectMode(CORNERS);
  strokeCap(PROJECT);
  noSmooth();
  //smooth(8);
  
  paper = forPrinting ? color(1) : color(0.2, 0.05, 1.0);
  ink = forPrinting ? color(0) : #050000;
  
  resist = createGraphics(width,height);
  flock = new Flock();
  
  init();
}

void init(){
  background(paper);
  noFill();
  stroke(ink);
  strokeWeight(lineWidth);
  
  startup();
  
  drawResist();
  
  if(additive){
    image(loadImage(filename), 0, 0);
  }
  
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
    if(frameCount < 30){
      density = random(1) < .5 ? 1.0 : random(.6, .9);
      drawResist();
      if(showResist){
        background(paper);
        image(resist,0,0);
      }
      spawnBoids();
      spawnBoids();
    }
    timeout++;
  } else {
    timeout = 0;
  }
  
  if(timeout > hangTime){
    saveAndQuit();
  }
  
  shifts();
}
