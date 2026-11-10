class Particle {
  PVector pos, vel, acc;
  float size;
  float sizeScalar;
  color col;
  int life;
  
  Particle(){
    pos = new PVector(startX.pick(), startY.pick());
    vel = new PVector(0, 0, 0);
    acc = PVector.random2D().mult(acceleration);
    
    size = particleSize.pick();
    sizeScalar = coreSizeScalar.pick();
    col = color(red.pick(), green.pick(), blue.pick(), opacity);
    life = lifeSpan.pick();
  }
  
  void update(){
    if(life <= 0) return;
    
    life--;
    
    pos.add(vel);
    vel.add(acc);
    if(col == bg){
      vel.limit(eraserSpeedLimit);
    } else {
      vel.limit(particleSpeedLimit);
    }
    
    // value between [-1, 1]
    float noiseTurn = noise(pos.x * noiseScale, pos.y * noiseScale, size) * 2 - 1;
    noiseTurn *= TAU * turnRadius;
    acc.rotate(noiseTurn);
  }
  
  void display(){
    if(life <= 0) return;
    
    resetMatrix();
    fill(col);
    
    translate(pos.x, pos.y);
    // rotating by acc is more chaotic and breaks up
    // the shapes more
    // rotating by vel will add more coherence
    rotate(acc.heading());
    
    if(col == bg){
      // eraser rules
      circle(0, 0, size / max(1, vel.mag()));
    } else {
      // non-eraser rules
      // draw the outer and then the inner to complicate the shape
      square(0, 0, size);
      fill(bg, coreOpacity);
      square(0, 0, size * sizeScalar / max(1, vel.mag()));
    }
  }
}
