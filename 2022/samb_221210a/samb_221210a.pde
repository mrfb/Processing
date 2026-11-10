/*

hi samb!

you can run this as often as you like
and get different results each time. it'll save the
result to a glossy .png in the output folder when it's done.

i exposed a bunch of tuning variables, you're more than
welcome to play around with them and see what you get!

if there are any bigger changes you want, 
or if you're trying to get a particular result, let me know.

-- mrfb 2022-12-10 <3

*/

// QUANTITY
int numParticles = 200; // too many and the colors wash out
int numErasers = 5; // some subset of the particles can be erasers!

// SPAWNING
IntRange lifeSpan = new IntRange(50, 1000); // measured in frames
FloatRange startX = new FloatRange(500, 524);
FloatRange startY = new FloatRange(500, 524);

// PARTICLES
// each particle is a square of some color
// with a smaller eraser in the center
FloatRange particleSize = new FloatRange(10, 100);
FloatRange eraserSize = new FloatRange(50, 100);
// particle interiors are mild erasers, based on size of particle
FloatRange coreSizeScalar = new FloatRange(0.25, 0.50);

// SPEED & MOVEMENT
float acceleration = .25; // lower tends to work better
float turnRadius = .05;
float particleSpeedLimit = 5;
float eraserSpeedLimit = 5;
float noiseScale = 0.01;

// COLORS
// the particles get their color settings from these
// the integers can be anywhere from 0-255
color bg = #ffffff; // any hex color is fine!
IntRange red = new IntRange(0, 32);
IntRange green = new IntRange(32, 128);
IntRange blue = new IntRange(128, 255);
int opacity = 3; // low numbers work best for the watercolor effect
int coreOpacity = 5; // for the interior eraser

// --------------------------------------------------
// stuff below here is easier to break if they change
Particle[] particles;

void setup(){
  size(1024, 1024);
  background(bg);
  
  particles = new Particle[numParticles];
  for(int i = 0; i < numParticles; i++){
    particles[i] = new Particle();
    
    if(i < numErasers){
      particles[i].col = bg;
      particles[i].size = eraserSize.pick();
    }
  }
  
  noStroke();
  rectMode(CENTER);
}

void draw(){
  boolean alive = false;
  
  for(Particle p : particles){
    p.display();
    p.update();
    
    if(p.life > 0 && alive == false){
      alive = true;
    }
  }
  
  if(alive == false){
    println("everybody's dead! we're done here.");
    String filename = "" + year() + month() + day() + "_" + hour() + minute() + second() + ".png";
    save("output/" + filename);
    println("saved as " + filename);
    noLoop();
  }
}
