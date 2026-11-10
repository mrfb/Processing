// our tweaking global variables
int numMarkers = (int)random(10, 100);
int threshold = (int)random(3000, 8000);

// our non-tweaking global variables
Particle[] markers;

// this runs once and only once, at the very beginning
void setup() {
  // general setup
  size(900, 900);
  colorMode(HSB, TAU, 1.0f, 1.0f, 1.0f);
  background(#ffffff);
  
  println("numMarkers: " + numMarkers);
  println("threshold: " + threshold);
  
  markers = new Particle[numMarkers];
  for(int i = 0; i < markers.length; i++){
    markers[i] = new Particle();
  }
}

// this runs over and over again
void draw() {
  if(frameCount > threshold){
    save(threshold + ".png");
    println("Saved as " + threshold + ".png");
    exit();
  }
  
  
  for (int i = 0; i < markers.length; i++) {
    markers[i].update();
  }
  
  noFill();
  stroke(#ffffff);
  strokeWeight(width * .5);
  rectMode(CENTER);
  translate(width/2, height/2);
  rotate(TAU*.125);
  square(0, 0, width * 1.2);
}
