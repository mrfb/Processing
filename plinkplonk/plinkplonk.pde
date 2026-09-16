// definitely fiddle with these
float changeSpeed = 0.005 + random(-0.002, 0.002); // how fast color cycles
float xWiggle = 5 + random(-2, 2); // max side-to-side movement
float yWiggle = 5 + random(-2, 2); // max up-and-down movement
float circleSize = 30 + random(-10, 20); /// bigness of circle
int jumps = (int)random(3, 25);  // how many worms

// maybe fiddle with these
PVector interior = new PVector(.25, .25);
float interiorWidth = .50;
float interiorHeight = .50;
float interiorWeight = 5.0;

String message = ""; // overwrite for manual message

// don't fiddle with these
PVector p = new PVector();  

void setup() {
  size(800, 800);
  //fullScreen();
  startup();
  colorMode(HSB, 255);
  background(random(255), 10 + random(54), 200 + random(55));
  println("jumps: " + jumps);
  
  // draw the interior frame
  noFill();
  interior.x *= width;
  interior.y *= height;
  interiorWidth *= width;
  interiorHeight *= height;
  strokeWeight(interiorWeight);
  rect(interior.x, interior.y, interiorWidth, interiorHeight);
  
  // randomize our particle location
  setP();
  noStroke();
  
  // pick the words
  if(message == ""){
    int rnoun = (int)random(nouns.size());
    String noun = nouns.get(rnoun);
    int radj = (int)random(adjs.size());
    String adj = adjs.get(radj);
    message = noun + " " + adj;
  }
  println("text: " + message);
  
  // style the words
  PFont font = createFont("ACaslonPro-BoldItalic", 48);
  fill(0);
  textFont(font);
  textAlign(CENTER);
  textSize(48);
  
  // draw the words
  text(message, width/2, interior.y + interiorHeight + 50);
}

void draw() {
  // cycle goes from -1 to 1 slowly
  float cycle = sin(frameCount * changeSpeed);
  float nextCycle = sin((frameCount + 1) * changeSpeed);
  
  fill(cycle * 255);  // black and grey-white-grey worms

  //fill(cycle < 0 ? 0 : 255); // black and white worms

  // when cycle is about to change sign, it'll be negative -- jump then
  if(cycle * nextCycle < 0){
    setP();
  }
  
  if(jumps <= 0) saveAndQuit();
  
  // draw the circle
  ellipse(p.x, p.y, circleSize * cycle, circleSize * cycle);

  // random wander
  p.x += random(-xWiggle, xWiggle);
  p.y += random(-yWiggle, yWiggle);

}

void setP(){
  p.x = random(interior.x, interior.x + interiorWidth);
  p.y = random(interior.y, interior.y + interiorHeight);
  jumps--;
}
