import processing.pdf.*;

// Like 0f specifies to the computer that it's
// a float, 0L specifies it's a long integer.
long seed = 0L;

void setup() {
  size(612, 612); // 612p = 8.5in x 72p/i; 792p = 11in x 72p/i
  background(#ffffff);
  noLoop();
  noFill();
  setSeed();

  beginRecord(PDF, "output.pdf");
}

void draw() {
  // This is the main component of your plotter program
  translate(width/2, height/2);

  // the minimum and maximum radius of our lines
  float innerRadius = .5 * 72;
  float outerRadius = 3.75 * 72;
  
  float innerSwing = random(9, 72);
  float outerSwing = random(9, 72);
  
  float numFins = 10;
  
  for (int j = 0; j < numFins; j++) {
    // draw a line
    rotate(TAU * random(1));
    line(0, outerRadius, 0, innerRadius);
    
    // draw echo lines based on it
    // each echo has its start and end point change a bit
    // but won't go outside the inner/outer radiuses
    int echoes = round(random(5, 15));
    float outerAdj = 0;
    float innerAdj = 0;
    float rotation = random(.005, .03);
    if(random(1) > .5) {
      rotation *= -1; // 50% chance of going the opposite direction
    }
    for (int i = 0; i < echoes; i++) {
      outerAdj += random(1)*outerSwing;
      innerAdj += random(1)*innerSwing;
      float inner = constrain(innerRadius + innerAdj, innerRadius, outerRadius);
      float outer = constrain(outerRadius - outerAdj, innerRadius, outerRadius);
      rotate(TAU * rotation);
      line(0, outer, 0, inner);
    }
  }

  endRecord();
  save(seed + ".png");
}

void setSeed() {
  if (seed == 0L) {
    seed =  second() * 1L;
    seed += minute() * 100L;
    seed += hour()   * 10000L;
    seed += day()    * 1000000L;
    seed += month()  * 100000000L;
    seed += year()   * 10000000000L;
  }

  println("seed: " + seed);
  randomSeed(seed);
}
