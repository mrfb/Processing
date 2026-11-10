class Bird {
  PVector pos;
  float forwardSpeed;
  
  float direction;
  float turnSpeed;
  
  color col;
  
  float wingspan, beak, sweep;
  
  float noiseScale;
  
  Bird(float x, float y, float sp, float dir){
    pos = new PVector(x, y);
    forwardSpeed = random(.25, 3);
    turnSpeed = sp;
    
    direction = dir;
    
    col = color(random(180, 255), random(150, 255), random(50, 180));
    
    wingspan = 10;
    beak = 20;
    sweep = -10;
    
    noiseScale = 1.00;
  }
  
  void display(){
    // bird display
    //resetMatrix();
    //translate(pos.x, pos.y);
    //rotate(direction);
    //fill(col);
    //quad(beak, 0,          // front point
    //     sweep, -wingspan, // left point
    //     0, 0,             // back point
    //     sweep, wingspan); // right point
    
    // point display
    //stroke(col);
    //point(0, 0);
    
    for(int i = 0; i < birds.length; i++){
      strokeWeight(1.498);
      stroke(0, 2);
      line(pos.x, pos.y, birds[i].pos.x, birds[i].pos.y);
    }
  }
  
  void update(){
    float turnAdjust = noise(pos.x * noiseScale, pos.y * noiseScale) * 2 - 1;
    direction += turnSpeed * turnAdjust;
    pos.x += cos(direction) * forwardSpeed;
    pos.y += sin(direction) * forwardSpeed;
    
    boolean tooFarLeft  = pos.x <= leftEdge;
    boolean tooFarRight = pos.x >= rightEdge;
    boolean tooFarUp    = pos.y <= topEdge;
    boolean tooFarDown  = pos.y >= bottomEdge;
    
    if(tooFarLeft || tooFarRight){
      println("hit the margin.");
      screenshot();
      //noLoop();
      pos.x = random(leftEdge, rightEdge);
    }
    if(tooFarUp || tooFarDown){
      println("hit the margin.");
      screenshot();
      //noLoop();
      pos.y = random(topEdge, bottomEdge);
    }
    
  }
  
  void destroy(){
    if(abs(width/2 - pos.x) < 25){
      col = color(255, 0);
    }
  }
  
}
