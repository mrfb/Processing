// an array to hold all of our particles
Particle[] particles;

void setup() {
  size(1024, 1024);

  // allocate our array
  particles = new Particle[256];
  // initialize our array by calling our constructor on each
  // object within it
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  
  // draw the background once in setup to build up the image
  background(255);
}

void draw() {
  //background(255);
  
  // call update on each object in the array
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
  }
}

class Particle {
  // fields
  float x, y;
  int size;
  color col;

  // constructors
  Particle (float p_X, float p_Y, int p_size, color p_col) {
    x = p_X;
    y = p_Y;
    size = p_size;
    col = p_col;
  }

  Particle () {
    reset();
  }

  // methods
  void update() {
    fill(col);
    noStroke();
    circle(x, y, size);

    wander();
    diminish();
  }
  
  void wander(){
    // movement speed is faster when the particle is small
    x += random(-500, 500) / max(size, 0.01);
    y -= 100 / max(size, 0.01);
  }
  
  void diminish(){
    if (random(1) < 1 - (y / height)) {
      size *= 0.99;
    }
    if (size <= 0) {
      reset();
    }
  }

  void reset() {
    // randomize size
    size = (int)random(25, 300);

    // randomize location
    y = height + size/2.0 + random(500);
    x = random(width);

    // randomize color
    col = color(random(180, 255),
      random(180, 255),
      random(180, 255),
      random(10));
  }
}
