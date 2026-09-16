import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 
import gohai.simpletweet.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class geltober extends PApplet {

String caption = "";
String mode = "";

// fuss with these
boolean loop = false;
boolean forPrinting = false; // sets paper to white and ink to black
float lineWidth = width*.04f;
float boxWidth = width*.06f;

// don't fuss with these
int paper, ink;
boolean done = false;
ArrayList<Particle> particles = new ArrayList<Particle>();
Palette p;

public void setup(){
   // general deployment
  //size(2400, 2400); // 6" for printing
  //size(666, 666); // worksize
  //fullScreen(); // pretty
  
  colorMode(HSB, 1.0f);
  ellipseMode(CENTER);
  rectMode(CORNERS);
  strokeCap(PROJECT);
  
  //noSmooth();
  
  noiseDetail(PApplet.parseInt(random(1, 8)), random(.6f));
  
  p = new Palette(4);
  
  paper = forPrinting ? color(1) : 0xff050505;
  ink = forPrinting ? color(0) : p.getColor(0);
  
  int c1, c2, c3;
  c1 = p.getColor();
  c2 = p.getColor();
  c3 = p.getColor();
  p.c[1] = c1;
  p.c[2] = c2;
  p.c[3] = c3;
  
  init();
  
  setMode();
}

public void init(){
  background(paper);
  noFill();
  stroke(ink);
  
  strokeWeight(boxWidth);
  rect(width*.10f, height*.10f, width*.90f, height*.90f);
  
  strokeWeight(lineWidth);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  
  startup();
}

public void sign(){
  println("starting signature");
  // redraw the box
  strokeWeight(boxWidth);
  stroke(ink);
  noFill();
  rect(width*.10f, height*.10f, width*.90f, height*.90f);
  
  // write the seed and mode
  stroke(ink);
  fill(ink);
  PFont f = createFont("Avenir-Book", height*.02f);
  textFont(f);
  textAlign(RIGHT, TOP);
  text("@mrfb @geltober "+mode+"."+seed, width*.90f, height*.91f);
}

public void draw(){
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
  
  if(particles.isEmpty()){
    if(drip > 0){
      drip--;
      drop();
    } else {
      done = true;
    }
  }
}
public void drawPalette(Palette p, PVector pos, int size){
  stroke(1);
  for(int i = 0; i < p.c.length; i++){
    fill(p.c[i]);
    rect(pos.x + (size + 2) * 2 * i, pos.y, size, size);
  }
  noStroke();
}

class Palette{
  int numColors;
  int[] c;
  ArrayList<Integer> usedColors = new ArrayList<Integer>();
  
  public String getUsedColors(){
    String output = "";
    
    if(usedColors.isEmpty()){
      return "no colors used";
    }
    
    for (int uc : usedColors){
      output += "0x" + hex(uc, 6) + " x " + round(alpha(uc) * 100) + "%";
      // add a linebreak unless this is the last item in the array
      if(usedColors.indexOf(uc) != (usedColors.size() - 1)) output += "\n";
    }
    
    return output;
  }
  
  public boolean colorIsUsed(int c){
    for (int uc : usedColors){
      if(c == uc) return true;
    }
    return false;
  }
  
  public int getColor(int index){
    if(index >= 0 && index < c.length){
      return c[index];
    } else{
      int rCol = PApplet.parseInt(random(1, c.length));
      return c[rCol];
    }
  }
  
  public int getColor(){
    int col;
    int attempts = 0;
    do{
      // Pick two colors in the palette...
      int from, to;
      do{
        from = PApplet.parseInt(random(numColors));
        to = PApplet.parseInt(random(numColors));
      }while(from == to);
      
      // ...randomly lerp between them...
      float lerp = random(1);
      col = lerpColor(c[from], c[to], lerp);
      
      attempts++;
    }while(colorIsUsed(col) && attempts < 10);  // only continue if this color hasn't been used yet
    
    // add the new color to usedColors
    usedColors.add(col);
    
    // ...and return the result.
    return col;
  }
  
  // merge constructor
  Palette(Palette a, Palette b){
    numColors = a.c.length + b.c.length;
    
    for (int uc : a.usedColors){
      usedColors.add(uc);
    }
    for (int uc : b.usedColors){
      usedColors.add(uc);
    }
    
    c = new int[numColors];
    
    int i = 0;
    for( ; i < a.c.length ; i++){
      c[i] = a.c[i];
    }
    
    for( ; i < numColors; i++){
      c[i] = b.c[i - a.c.length];
    }
  }
  
  Palette(int nColors){
    numColors = nColors;
    c = new int[numColors];
    
    // pick a palette
    String[] palettes = {"vivid", "pale", "wild"};
    String palette = pick(palettes);
    
    // The first color is always a wildcard.
    c[0] = color(random(1), random(1), random(.4f, 1));
    
    // Pick random ranges for HSB values.
    // For hue, pick a random point on the color wheel and then get a random
    // arc length extending away.
    float hMean = random(TAU);
    float hArc = pow(random(1), 3) * 0.8f * PI;  // maybe constrain range here
    float hMin = hMean - hArc;
    float hMax = hMean + hArc;
    
    float sMin = random(1);
    float sRange = random(1 - sMin);
    if(palette != "vivid") {
      sRange *= 0.8f;
    }
    if(palette == "pale"){
      sMin *= sMin; // lower minimum when the palette is pale
      sRange *= sRange;
    } else if (palette == "vivid"){
      sMin = sqrt(sMin); // raise minimum when vivid
      sRange = random(1 - sMin); // need to reroll the range with the higher min
    }
    
    float bMin = random(0.3f, 1.0f);
    float bRange = random(1 - bMin);
    
    float aMin = 1;
    float aRange = 1;

    // Now, pick n-1 colors in those ranges.
    for(int i = 1; i < numColors; i++){
      float rHue = random(hMin, hMax);
      rHue %= TAU; // [-0.5 PI, 1.5 PI] => [0, TAU]
      rHue /= TAU; // [0, TAU] => [0, 1]
      
      c[i] = color(rHue,
                   sMin + random(sRange),
                   bMin + random(bRange),
                   aMin + random(aRange));
    }
  }
}

public String pick(String[] array){
  return array[(int)random(array.length)];
}

public int pick(int[] array){
  return array[(int)random(array.length)];
}
// an individual particle

float noiseScale = .01f;
float dTau = 0.49f; // how much noise can affect directional velocity
boolean noiseKill = false;
boolean collideKill = false;
boolean heterogeneous = false;
float drip = 0;

class Particle {
  int lifetime = 30000;
  PVector loc;
  PVector ploc;
  PVector vel;
  PVector acc;
  
  float weight;
  int col;
  
  float speed;
  
  float vMin, vMax;
  
  float variance = 1;
  
  boolean dead = false;
  
  Particle(float x, float y, float dir){
    if(heterogeneous){
      variance = map(noise(x*noiseScale,y*noiseScale), 0, 1, 0, 2);
    }
    
    vMin = dir - (TAU*dTau*variance);
    vMax = dir + (TAU*dTau*variance);
    
    acc = new PVector(0,0);
    
    loc = new PVector(x,y);
    ploc = new PVector(x,y);
    vel = new PVector(0,0);
    weight = lineWidth;
    col = p.getColor(-1);
    
    speed = lineWidth * 0.5f;
  }
  
  public void update(){
    ploc.x = loc.x;
    ploc.y = loc.y;
    
    float dir = noise(loc.x * noiseScale * variance, loc.y * noiseScale * variance);
    dir = map(dir, 0, 1, vMin, vMax) - TAU*.25f;
    //dir = dir*TAU;
    vel = PVector.fromAngle(dir).mult(speed);
    //acc = PVector.fromAngle(dir).mult(speed * noise(loc.x * noiseScale, loc.y * noiseScale));
    
    vel.x += acc.x;
    vel.y += acc.y;
    
    loc.x += vel.x;
    loc.y += vel.y;
    
    int nextSpot = get(PApplet.parseInt(loc.x+vel.x), PApplet.parseInt(loc.y+vel.y));
    if(collideKill && nextSpot != paper && nextSpot != ink){
      dead = true;
      return;
    }
    
    lifetime--;
    if(loc.x < 0 || loc.x >= width || loc.y < 0 || loc.y >= height || lifetime < 0){
      dead = true;
      return;
    }
    
  }
  
  public void render(){
    if(noiseKill && noise(loc.x, loc.y) < .3f){
      return;
    }
    if(loc.x < width*.1f || loc.x > width*.9f || loc.y < height*.1f || loc.y > height*.9f || dead){
      return;
    }
    stroke(col);
    strokeWeight(weight);
    line(ploc.x, ploc.y, loc.x, loc.y);
  }
}
public void setMode(){
  String[] permittedModes = {"grid-1", "grid-2", "kinetic", "perspective"};
  
  int rMode = PApplet.parseInt(random(permittedModes.length));
  rMode = PApplet.parseInt(random(permittedModes.length));
  mode = permittedModes[rMode];
  
  // for production
  //mode = "repeat";
  
  println("mode: " + mode);
  
  switch(mode){
    case "grid-1":
      grid1();
      break;
    case "grid-2":
      grid2();
      break;
    case "kinetic":
      kinetic();
      break;
    case "perspective":
      perspec();
      break;
    case "repeat":
      repeat();
    default:
      // this shouldn't happen
      exit();
      break;
  }
}

public void repeat(){
  
}

public void perspec(){
  // timed drops for shapes overlapping
  // heterogeneous shapes/scales
  dTau = random(15); // flag for heterogenous dTau per particle
  noiseScale = random(20)/width;
  
  collideKill = true;
  heterogeneous = true;
  strokeCap(PROJECT);
  
  drip = 20;
}

public void drop(){
  float dir = random(TAU);
  //dTau = random(.5, 5);
  PVector p = new PVector(random(width*.1f, width*.9f), random(height*.1f, height*.9f));
  particles.add(new Particle(p.x, p.y, dir));
  particles.add(new Particle(p.x, p.y, dir+TAU*.5f));
}

public void kinetic(){
  dTau = 20;
  noiseScale = 0.8f/width;
  noiseKill = false;
  collideKill = true;
  strokeCap(PROJECT);
  
  int collisions = (int)random(2,69);
  for(int i = 0; i < collisions; i++){
    PVector p = new PVector(random(width), random(height));
    int spokes = PApplet.parseInt(random(2,9));
    for(int j = 0; j < spokes; j++){
      particles.add(new Particle(p.x, p.y, TAU*random(1) ));
    }
  }
}

public void grid2(){
  noiseScale = random(0.001f, 0.01f);
  println("noiseScale: " + noiseScale);
  dTau = random(0.05f, 0.25f);
  println("dTau: " + dTau);
  
  int intersections = PApplet.parseInt(random(5, width/25));
  println("intersections: " + intersections);
  for(int i = 0; i < intersections; i++){
    //PVector p = new PVector(random(width*.1, width*.9), random(height*.1, height*.9));
    PVector p;
    if(i%2 == 0){
      p = new PVector(width*(i+1)/(intersections+2.0f), height*.09f);
      particles.add(new Particle(p.x, p.y, TAU*.00f));
      particles.add(new Particle(p.x, p.y, TAU*.50f));
      
      p = new PVector(width*.09f, height*(i+1)/(intersections+2.0f));
      particles.add(new Particle(p.x, p.y, TAU*.25f));
      particles.add(new Particle(p.x, p.y, TAU*.75f));
    } else {
      p = new PVector(width*(i+1)/(intersections+2.0f), height*.91f);
      particles.add(new Particle(p.x, p.y, TAU*.00f));
      particles.add(new Particle(p.x, p.y, TAU*.50f));
      
      p = new PVector(width*.91f, height*(i+1)/(intersections+2.0f));
      particles.add(new Particle(p.x, p.y, TAU*.25f));
      particles.add(new Particle(p.x, p.y, TAU*.75f));
    }
  }
}

public void grid1(){
  // get corners
  PVector ul, ur, bl, br;
  
  switch((int)random(3)){
    case 0: // keep to respective corners
      ul = new PVector(random(width*.15f, width*.50f), random(height*.15f,height*.50f));
      ur = new PVector(random(width*.50f, width*.85f), random(height*.15f,height*.50f));
      bl = new PVector(random(width*.15f, width*.50f), random(height*.50f,height*.85f));
      br = new PVector(random(width*.50f, width*.85f), random(height*.50f,height*.85f));
      break;
    case 1: // anywhere goes
      ul = new PVector(random(width*.15f, width*.85f), random(height*.15f,height*.85f));
      ur = new PVector(random(width*.15f, width*.85f), random(height*.15f,height*.85f));
      bl = new PVector(random(width*.15f, width*.85f), random(height*.15f,height*.85f));
      br = new PVector(random(width*.15f, width*.85f), random(height*.15f,height*.85f));
      break;
    default: // use box
      ul = new PVector(width*.10f, height*.10f);
      ur = new PVector(width*.90f, height*.10f);
      bl = new PVector(width*.10f, height*.90f);
      br = new PVector(width*.90f, height*.90f);
      break;
  }
  
  point(ul.x, ul.y);
  point(ur.x, ur.y);
  point(bl.x, bl.y);
  point(br.x, br.y);
  
  // draw box around corners
  stroke(p.getColor(-1));
  line(ul.x, ul.y, ur.x, ur.y);
  stroke(p.getColor(-1));
  line(ur.x, ur.y, br.x, br.y);
  stroke(p.getColor(-1));
  line(br.x, br.y, bl.x, bl.y);
  stroke(p.getColor(-1));
  line(bl.x, bl.y, ul.x, ul.y);
  
  // draw ten points on each line
  int segments = (int)random(1,20);
  float[] top = new float[segments];
  float[] bottom = new float[segments];
  float[] left = new float[segments];
  float[] right = new float[segments];
  
  for(int i = 0; i < segments; i++){
    top[i] = random(1);
    bottom[i] = random(1);
    left[i] = random(1);
    right[i] = random(1);
  }
  
  top = sort(top);
  bottom = sort(bottom);
  left = sort(left);
  right = sort(right);
  
  for(int i = 0; i < segments; i++){
    // draw a top-bottom line
    PVector t = new PVector(lerp(ul.x, ur.x, top[i]), lerp(ul.y, ur.y, top[i]));
    PVector b = new PVector(lerp(bl.x, br.x, bottom[i]), lerp(bl.y, br.y, bottom[i]));
    stroke(p.getColor(-1));
    line(t.x, t.y, b.x, b.y);
    
    // draw a left-right lines
    PVector l = new PVector(lerp(ul.x, bl.x, left[i]), lerp(ul.y, bl.y, left[i]));
    PVector r = new PVector(lerp(ur.x, br.x, right[i]), lerp(ur.y, br.y, right[i]));
    stroke(p.getColor(-1));
    line(l.x, l.y, r.x, r.y);
    
  }
  
  done = true;
}



// generally, call startup() somewhere in setup() and saveAndQuit() when finished
// note line 35 which handles the tweet caption when saving to twitter

String filename = "output";
boolean saveToPNG = true;
boolean saveToPDF = false;
boolean saveToTwitter = true;
boolean pauseOnFinish = false;
long seed = 0L; // set to non-zero value to set manual seed

public void startup(){
  if(saveToPDF){
    beginRecord(PDF, filename + ".pdf");
  }
  setSeed();
}

public void saveAndQuit(){
  println("all done.");
  
  if(saveToPNG){
    save(filename + ".png");
    println("saved as " + filename + ".png");
  }
  
  if(saveToTwitter){
    tweetCanvas(mode+"."+seed);
  }
  
  if(saveToPDF){
    endRecord();
  }
  
  println("bye!");
  if(pauseOnFinish){
    noLoop();
  } else {
    exit();
  }
}

public void tweetCanvas(String tweetText){
  SimpleTweet inktober2019 = new SimpleTweet(this);
    
  inktober2019.setOAuthConsumerKey("cOpRnDiIa0Sz17LyJrGLITyLj");
  inktober2019.setOAuthConsumerSecret("iOrajZBeQRxIfqRvjXXx8ZF1wHmHBz7rFW48a1N6c4IEPJfv8G");
  inktober2019.setOAuthAccessToken("1179155689853333504-G7y6Zm0xFvVTJSVKccngp2BtjLorHg");
  inktober2019.setOAuthAccessTokenSecret("6DyPeapfQXaepgyzaTrIzUcwnYmjlUoeKoHOPPrEjbAh3");
  
  println("tweetText: " + tweetText);
  String tweet = inktober2019.tweetImage(get(), tweetText);
  println("tweeted: " + tweet);
}

public void setSeed(){
  if(seed == 0L){
    seed =  second() * 1L;
    seed += minute() * 100L;
    seed += hour()   * 10000L;
    seed += day()    * 1000000L;
    seed += month()  * 100000000L;
    seed += year()   * 10000000000L;
  }
  
  println("seed: " + seed);
  randomSeed(seed);
  noiseSeed(seed);
}
  public void settings() {  size(2048, 2048); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "geltober" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
