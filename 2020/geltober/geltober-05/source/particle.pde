// an individual particle

float noiseScale = .01;
float dTau = 0.49; // how much noise can affect directional velocity
boolean noiseKill = false;
boolean collideKill = false;
boolean heterogeneous = false;
float drip = 0;
float dripTimed = 0;
int dripTimedGap = 10;

class Particle {
  int lifetime = 30 * 75;
  PVector loc;
  PVector ploc;
  PVector vel;
  PVector acc;
  
  float weight;
  color col;
  float speed;
  float vMin, vMax;
  
  PVector noiseOffset =  new PVector(0, 0);
  
  float variance = 1;
  int spawnTime;
  
  
  boolean dead = false;
  
  float getNoise(){
    return noise(variance * noiseScale * (loc.x + noiseOffset.x), 
                 variance * noiseScale * (loc.y + noiseOffset.y),
                 variance * noiseScale * spawnTime);
  }
  
  Particle(float x, float y, float dir){
    if(heterogeneous){
      variance = map(noise(x * noiseScale, y * noiseScale), 0, 1, 0, 2);
    }
    
    vMin = dir - (TAU*dTau*variance);
    vMax = dir + (TAU*dTau*variance);
    
    acc = new PVector(0,0);
    
    loc = new PVector(x,y);
    ploc = new PVector(x,y);
    vel = new PVector(0,0);
    weight = lineWidth;
    col = p.getColor(-1);
    
    speed = lineWidth * 0.5;
    spawnTime = frameCount;
  }
  
  void update(){
    ploc.x = loc.x;
    ploc.y = loc.y;
    
    float dir = getNoise();
    dir = map(dir, 0, 1, vMin, vMax) - TAU*.25;
    //dir = dir*TAU;
    vel = PVector.fromAngle(dir).mult(speed);
    //acc = PVector.fromAngle(dir).mult(speed * noise(loc.x * noiseScale, loc.y * noiseScale));
    
    vel.x += acc.x;
    vel.y += acc.y;
    
    loc.x += vel.x;
    loc.y += vel.y;
    
    color nextSpot = get(int(loc.x+vel.x), int(loc.y+vel.y));
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
  
  void render(){
    if(noiseKill && noise(loc.x, loc.y) < .3){
      return;
    }
    if(loc.x < width*.1 || loc.x > width*.9 || loc.y < height*.1 || loc.y > height*.9 || dead){
      return;
    }
    stroke(col);
    strokeWeight(weight);
    line(ploc.x, ploc.y, loc.x, loc.y);
  }
}
