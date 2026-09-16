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
float density = 1;

// spawn boids here
void spawnBoids(){
  
  if(random(1) > .5){
    // Jellyfish in love
    flockSettings(1.0, 1.0, 1.0, 1.5, 0.03);
  } else {
    flockSettingsRandom();
  }
  
  spawnDensity = random(1)<.2 ? random(.15) : 0;
  
  invisibleChance = 0;
  spawnRandom(1);
  
  if(someSmallGames) spawnRandom(width);
  
  do{
    density = random(1) < .2 ? 1.0 : random(.1, .9);
    invisibleChance = random(1) < .2 ? 0.0 : random(.1, .9);
    switch((int)random(0, 8)){
      case 0:
        // 3x3 boxes
        float boxChance = random(1) < 0.5 ? 1 : random(.1, .9);
        //boxChance = 1;
        for(float w = .25; w < 1; w += .25){
          for(float h = .25; h < 1; h += .25){
            if(h == .5) continue;
            if(random(1) > boxChance) continue;
            spawnBox(new PVector(width*w, height*h), round(random(3, 20)), width*.1, 0);
            if(random(1) < .25){
              spawnPointSpread(new PVector(width*w, height*h), round(random(3,21)));
            }
          }
        }
        break;
      case 1:
        // jellyfish
        int jellyfish = (int)random(100);
        for(int i = 0; i < jellyfish; i++){
          spawnPointSpread(new PVector(random(width), random(height)), round(random(20, 40)));
        }
        break;
      case 2:
        // some kind of line
        PVector A = new PVector(random(width), random(height));
        PVector B = new PVector(random(width), random(height));
        switch((int)random(6)){
          case 0:
            B.x = A.x;
            break;
          case 1:
            B.y = A.y;
            break;
          case 2:
            A.x = 0;
            B.x = width;
            break;
          case 3:
            A.y = 0;
            B.y = height;
          default:
            break;
        }
        spawnLine((int)random(5,100), A, B);
        break;
      case 3:
        spawnTriangle((int)random(5, 100));
        break;
      default:
        // circle
        int numCircles = random(1) < .5 ? 1 : (int)random(4);
        for(int i = 0; i < numCircles; i++){
          float r = random(width*.05, width*.45);
          spawnWreath(round(random(50, 200)), new PVector(width/2, height/2), r, r, 0, 1);
        }
        if(random(1) < .05){
          spawnPointSpread(new PVector(width/2, height/2), round(random(20, 40)));
        }
        break;
    }
  }while(random(1) < 0.33);
}

/*
 *
 * Below here are individual spawning functions.
 *
 */
 
 
// need to write the stuff to stagger the boxes and spawn the next one 
void spawnBoxes(){
  
}
 
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
  
  float offset = TAU*random(0.30, 0.70);  // keep within boxes
  offset = random(1);  // anything goes
  
  theta = TAU*.75 + offset + rotation;
  for (int i = 0; i < boidsPerEdge; i++) {
    if(random(1) > density) continue;
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(a.x, b.x, lerp), lerp(a.y, b.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
  theta += TAU*.25;
  for (int i = 0; i < boidsPerEdge; i++) {
    if(random(1) > density) continue;
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(b.x, c.x, lerp), lerp(b.y, c.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
  theta += TAU*.25;
  for (int i = 0; i < boidsPerEdge; i++) {
    if(random(1) > density) continue;
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(c.x, d.x, lerp), lerp(c.y, d.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
  theta += TAU*.25;
  for (int i = 0; i < boidsPerEdge; i++) {
    if(random(1) > density) continue;
    lerp = (float)i / (float)boidsPerEdge;
    spawnPoint.set(lerp(d.x, a.x, lerp), lerp(d.y, a.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, theta));
  }
  
}
 
void spawnDrip(){
  if(drips > 0) drips--; else return;
  spawnPointSpread(new PVector(width*random(1), height*random(1)), (int)random(20, 40));
}

// spawns num boids at the point in a random direction
void spawnPoint(PVector center, int num){
  for (int i = 0; i < num; i++) {
    if(random(1) > density) continue;
    flock.addBoid(new Boid(center.x, center.y));
  }
}

// as spawnPoint, but with a spread angle
void spawnPointSpread(PVector center, int num){
  float theta = 0;
  for (int i = 0; i < num; i++) {
    if(random(1) > density) continue;
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

// spawns in a disc, with fixed angles
void spawnWreath(int num, PVector center, float min, float max, float minTheta, float maxTheta){
  boolean arcMode = random(1) < .5;
  PVector spawn = center.copy();
  float offset = random(minTheta, maxTheta);
  float arcBegin = random(TAU);
  for (int i = 0; i < num; i++) {
    if(!arcMode && random(1) > density) continue;
    if(arcMode && ((float)i / (float)num) > density) continue;
    spawn.set(center.x, center.y);
    spawn.add(PVector.fromAngle(arcBegin + i * TAU / num).setMag(random (min, max)));
    if(spawn.x < 0 || spawn.x > width || spawn.y < 0 || spawn.y > height) continue;
    flock.addBoid(new Boid(spawn.x, spawn.y, i * TAU / num + TAU*offset));
  }
}

// spawns in a line, evenly spaced
void spawnLine(int num, PVector p1, PVector p2){
  float direction = random(TAU);
  boolean randomDirection = random(1) < .2;
  float lerp;
  PVector spawnPoint = new PVector();
  for (int i = 0; i < num; i++) {
    if(random(1) > density) continue;
    lerp = (float)i / (float)num;
    if(randomDirection) direction = random(TAU);
    spawnPoint.set(lerp(p1.x, p2.x, lerp), lerp(p1.y, p2.y, lerp));
    flock.addBoid(new Boid(spawnPoint.x, spawnPoint.y, direction));
  }
}

void spawnTriangle(int num){
  PVector A, B, C;
  A = new PVector(random(width), random(height));
  B = new PVector(random(width), random(height));
  C = new PVector(random(width), random(height));
  
  spawnLine(num, A, B);
  spawnLine(num, B, C);
  spawnLine(num, C, A);
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
