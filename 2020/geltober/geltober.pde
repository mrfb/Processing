String caption = "";
String mode = "";

// fuss with these
boolean loop = false;
boolean forPrinting = false; // sets paper to white and ink to black
float lineWidth = width*.04;
float boxWidth = width*.06;

// don't fuss with these
color paper, ink;
boolean done = false;
ArrayList<Particle> particles = new ArrayList<Particle>();
Palette p;

boolean lockedDrop = false;
float startingDir = random(TAU);
PVector startingPoint = new PVector(0,0);

void setup(){
  size(2048, 2048); // general deployment
  //size(2400, 2400); // 6" for printing
  //size(666, 666); // worksize
  //size(800, 800);
  //fullScreen(); // pretty
  
  colorMode(HSB, 1.0);
  ellipseMode(CENTER);
  rectMode(CORNERS);
  strokeCap(PROJECT);
  
  //noSmooth();
  
  noiseDetail(int(random(1, 8)), random(.6));
  
  p = new Palette(4);
  
  paper = forPrinting ? color(1) : #050505;
  ink = forPrinting ? color(0) : p.getColor(0);
  
  startingPoint = new PVector(random(width*.25, width*.75),
                              random(height*.25, height*.75));
  
  color c1, c2, c3;
  c1 = p.getColor();
  c2 = p.getColor();
  c3 = p.getColor();
  p.c[1] = c1;
  p.c[2] = c2;
  p.c[3] = c3;
  
  init();
  
  setMode();
}

void init(){
  background(paper);
  noFill();
  stroke(ink);
  
  strokeWeight(boxWidth);
  rect(width*.10, height*.10, width*.90, height*.90);
  
  strokeWeight(lineWidth);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  
  startup();
}

void sign(){
  println("starting signature");
  // redraw the box
  strokeWeight(boxWidth);
  stroke(ink);
  noFill();
  rect(width*.10, height*.10, width*.90, height*.90);
  
  // write the seed and mode
  stroke(ink);
  fill(ink);
  PFont f = createFont("Avenir-Book", height*.02);
  textFont(f);
  textAlign(RIGHT, TOP);
  text("@mrfb @geltober "+mode+"."+seed, width*.90, height*.91);
}

void draw(){
  if(done){
    sign();
    saveAndQuit();
  }
  
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle part = particles.get(i);
    if (part.dead) {
      particles.remove(i);
    }
    part.update();
    part.render();
  }
  
  if(dripTimed > 0 && frameCount % dripTimedGap == 0){
    dripTimed--;
    drop();
  }
  
  if(particles.isEmpty()){
    if(drip > 0){
      drip--;
      drop();
    } else {
      done = true;
    }
  }
}
