class Eye{
  Spring2D s1, s2;
  Circle zone;
  
  float lerp;
  float jitter;
  float driftSpeed;
  float offset;
  float expressivity;
  float limitLower, limitUpper;
  
  Eye(){
    jitter = constrain(random(-.4, .1), 0, 1);
    lerp = random(0, 1);
    driftSpeed = random(0.5, 5.0);
    offset = random(0, 100);
    expressivity = random(0, .5);
    limitLower = random(0, 1);
    limitUpper = random(limitLower, 1);
    
    // this next line will make certain resolutions / #s of eyes weird
    float mass = random(15, width / e.length / 2);
    PVector gravity = PVector.random2D().mult(random(2,5));
    s1 = new Spring2D(width/2, height/2, mass, gravity);
    mass *= random(0.9, 1.1);
    s2 = new Spring2D(width/2, height/2, mass, new PVector(0,0).sub(gravity));
    float zoneRadius = s1.radius + s2.radius;
    PVector zonePos = new PVector(random(zoneRadius, width - zoneRadius),
                                  random(zoneRadius, height - zoneRadius));
    zone = new Circle(zonePos, zoneRadius);
    zone.wander = random(1.0);
  }
  
  void draw(){
    fill(255, 126);
    zone.update();
    collideZones();
    s1.update(zone.pos.x, zone.pos.y);
    s1.display(zone.pos.x, zone.pos.y);
    s2.update(s1.x, s1.y);
    s2.display(s1.x, s1.y);
    
    if(!thresh){
      // debug displays
      stroke(255, 126);
      noFill();
      ellipse(zone.pos.x, zone.pos.y, zone.r, zone.r);
      noStroke();
    }
    
    fill(0);
    float pupilSize = dist(s1.x, s1.y, s2.x, s2.y) / 2;
    ellipse(
      lerp(s1.x, s2.x, lerp) + zone.acc.x * jitter * pupilSize,
      lerp(s1.y, s2.y, lerp) + zone.acc.y * jitter * pupilSize, 
      pupilSize, pupilSize);
    lerp += random(-jitter, jitter);
    lerp += zone.vel.mag() * sin(frameCount * .05 + offset) * expressivity;
    lerp = constrain(lerp, limitLower, limitUpper);
  }
}

void collideZones(){
  int[] intersections = new int[e.length];
  
  for(int i = 0; i < e.length; i++){
    intersections[i] = 0;
    for(int j  = 0; j < e.length; j++){
      if(i == j) continue;
      float ijDist = abs(PVector.dist(e[i].zone.pos, e[j].zone.pos));
      if(ijDist < e[i].zone.r + e[j].zone.r){
        intersections[i]++;
      }
    }
    if(intersections[i] == 0){
      if(e[i].zone.vel.mag() == 0){
        e[i].zone.vel = PVector.random2D().mult(e[i].driftSpeed);
      }
      e[i].zone.acc.mult(0);
    } else if(e[i].zone.acc.mag() < e[i].driftSpeed){
        e[i].zone.acc = PVector.random2D().mult(1 + e[i].driftSpeed);
    }
  }
}
