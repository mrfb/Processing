// SPAWNING
// want to remove these...
boolean evenGrid = false;
boolean oddGrid = false;

// OTHER SPAWN BEHAVIORS
boolean drip = false;
int dripDelay = 10;
int drips = 100;
int hangTime = 100;  // time to wait at the end to allow for input
boolean spawnOnClick = true;   // at mouse location
boolean spawnOnDrag = true;   // at mouse location
boolean spawnOnPress = true;   // random location
float spawnDensity = 0.00; // clones with this likelihood per frame
int generationCap = 30; // for limiting clones -- kinda buggy

// spawn boids here
void spawnBoids(){
  // Jellyfish in love
  flockSettings(1.0, 1.0, 1.0, 1.5, 0.001);
  spawnDensity = 0.00;
  //for(int i = 0; i < 150; i++){
  //  PVector p = new PVector(random(width), random(height));
  //  float coef = noise(p.x, p.y);
  //  flock.addBoid(new Boid(p.x, p.y, TAU*coef));
  //}
  
  for(float w = .25; w < 1; w += .25){
    for(float h = .25; h < 1; h += .25){
      spawnBox(new PVector(width*w, height*h), round(random(3, 30)), 100, 0);
    }
  }
  
 
  
  //for(int i = 0; i < 100; i++){
  //  spawnPointSpread(new PVector(random(width), random(height)), round(random(20, 40)));
  //}
  //for(int i = 0; i < 0; i++){
  //  float r = random(5);
  //  spawnWreath(round(random(20, 40)), new PVector(random(r, width-r), random(r, height-r)), r, r, .8, 1.2);
  //}
  
}

/*
 *
 * Below here are individual spawning functions.
 *
 */
 
void spawnBox(PVector center, int boidsPerEdge, float radius, float rotation){
  translate(center.x, center.y);
  rotate(rotation);
  
  PVector a, b, c, d;
  /*
   * (-r, -r)       (+r, -r)
   *     a              b
   *
   *     d              c
   * (-r, +r)       (+r, +r)
   */
  
  
  a = new PVector(center.x-radius, center.y-radius);
  b = new PVector(center.x+radius, center.y-radius);
  c = new PVector(center.x+radius, center.y+radius);
  d = new PVector(center.x-radius, center.y+radius);
  
  float theta;
  float lerp;
  PVector spawnPoint = new PVector();
  
  // keeps internal
  float offset = TAU*random(0.30, 0.70);
  // anything goes
  //float offset = TAU*random(1);
  
  theta = TAU*.75 + offset + rotation;
  for (int i = 0; i < boidsPerEdge; i++) {
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(a.x, b.x, lerp), lerp(a.y, b.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
  theta += TAU*.25;
  for (int i = 0; i < boidsPerEdge; i++) {
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(b.x, c.x, lerp), lerp(b.y, c.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
  theta += TAU*.25;
  for (int i = 0; i < boidsPerEdge; i++) {
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(c.x, d.x, lerp), lerp(c.y, d.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
  theta += TAU*.25;
  for (int i = 0; i < boidsPerEdge; i++) {
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(d.x, a.x, lerp), lerp(d.y, a.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
}
 
void spawnDrip(){
  if(drips > 0) drips--; else return;
  spawnPointSpread(new PVector(width*random(1), height*random(1)), (int)random(20, 40));
}

void mouseDragged() {
  if(!spawnOnDrag) return;
  //flock.addBoid(new Boid(mouseX,mouseY));
  spawnPointSpread(new PVector(mouseX, mouseY), (int)random(10, 20));
}

void mouseClicked() {
  if(!spawnOnClick) return;
  //flock.addBoid(new Boid(mouseX,mouseY));
  spawnPointSpread(new PVector(mouseX, mouseY), (int)random(20, 40));
  //float r = random(100);
  //spawnWreath((int)random(20, 100), new PVector(mouseX, mouseY), r, r);
}

void keyPressed() {
  if(!spawnOnPress) return;
  flock.addBoid(new Boid(random(width), random(height)));
  //spawnPointSpread(new PVector(random(width), random(height)), (int)random(20, 40));
}

// spawns num boids at the point in a random direction
void spawnPoint(PVector center, int num){
  println("spawnPoint("+center+","+num+")");
  for (int i = 0; i < num; i++) {
    flock.addBoid(new Boid(center.x, center.y));
  }
}

// as spawnPoint, but with a spread angle
void spawnPointSpread(PVector center, int num){
  float theta = 0;
  for (int i = 0; i < num; i++) {
    theta = (float)i / (float)num * TAU;
    flock.addBoid(new Boid(center.x, center.y, theta));
  }
}

// random position, random direction
void spawnRandom(int num){
  for (int i = 0; i < num; i++) {
    flock.addBoid(new Boid(random(0, width),random(0, height)));
  }
}

// random position, direction a function of position
void spawnNoise(int num){
  println(num);
  // todo
}

// spawns in a disc, with fixed angles
void spawnWreath(int num, PVector center, float min, float max, float minTheta, float maxTheta){
  PVector spawn = center.copy();
  float offset = random(minTheta, maxTheta);
  for (int i = 0; i < num; i++) {
    spawn.set(center.x, center.y);
    spawn.add(PVector.fromAngle(i * TAU / num).setMag(random (min, max)));
    if(spawn.x < 0 || spawn.x > width || spawn.y < 0 || spawn.y > height) continue;
    flock.addBoid(new Boid(spawn.x, spawn.y, i * TAU / num + TAU*offset));
  }
}

// spawns in a line, evenly spaced
void spawnLine(int num, PVector p1, PVector p2){
  float lerp;
  PVector spawnPoint = new PVector();
  for (int i = 0; i < num; i++) {
    lerp = (float)i / (float)num;
    spawnPoint.set(lerp(p1.x, p2.x, lerp), lerp(p1.y, p2.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y));
  }
}

// spawns num boids in each of the corners
void spawnCorners(int num, PVector center, float w, float h){
  for (int i = 0; i < num; i++) {
    flock.addBoid(new Boid(center.x-w, center.y-h, random(TAU*0.75, TAU*1.00)));
    flock.addBoid(new Boid(center.x+w, center.y-h, random(TAU*0.50, TAU*0.75)));
    flock.addBoid(new Boid(center.x-w, center.y+h, random(TAU*0.0, TAU*0.25)));
    flock.addBoid(new Boid(center.x+w, center.y+h, random(TAU*0.25, TAU*0.50)));
  }
}

void spawnMidpoint(int num, PVector center, float w, float h){
  for (int i = 0; i < num; i++) {
    flock.addBoid(new Boid(center.x+0, center.y-h, random(TAU*0.50, TAU*1.00)));
    flock.addBoid(new Boid(center.x+w, center.y+0, random(TAU*0.25, TAU*0.75)));
    flock.addBoid(new Boid(center.x+0, center.y+h, random(TAU*0.0, TAU*0.50)));
    flock.addBoid(new Boid(center.x-w, center.y+0, random(TAU*0.75, TAU*1.25)));
  }
}

//int lineThickness = 24;
//void spawnGrid(boolean even){
//  for(int row = 0; row < 10; row++){
//    for(int col = 0; col < 16; col++){
//      if(even && (row + col) % 2 != 0) continue;
//      if(!even && (row + col) % 2 != 1) continue;
      
//      float minX = col * 90 + lineThickness*.5;
//      float maxX = minX + 90 - lineThickness*.5;
//      float minY = row * 90 + lineThickness*.5;
//      float maxY = minY + 90 - lineThickness*.5;
      
//      if(noise(minX,minY) < 0.5){
//        continue;
//      }
      
//      for(int i = 0; i < squareBoids; i++){
//        //flock.addBoid(new Boid(random(minX, maxX),random(minY, maxY)));
//        flock.addBoid(new Boid(minX + (1.0 * (i+1) / (squareBoids+2) * (maxX-minX)),
//                               maxY-15, 
//                               TAU*.75));
//      }
//    }
//  }
//}
