// movement
float speedMin = random(10);
  float speedMax = random(speedMin, 10);
float jitterMin = random(1);
  float jitterMax = random(jitterMin, 1);
float turninessMin = random(5);
  float turninessMax = random(turninessMin, 5);

// noise
float xWarp = random(1) * random(1);
float yWarp = random(1) * random(1);
float tWarp = random(1) * random(1);

//marker
float hueMin = random(TAU);
  float hueRange = random(TAU);
float satMin = random(.7);
  float satMax = random(satMin, .7);
float briMin = random(0.9, 1.0);
  float briMax = random(briMin, 1);
float alpMin = random(.001, .01);
  float alpMax = random(alpMin, .1);
float radMin = random(3);
  float radMax = random(radMin, 500);

float eraserChance = random(.9);

// base direction
float dir = random(TAU);

class Particle{
  // location
  float x, y;
  
  // movement
  float speed;
  float jitter;
  float turniness;
  
  // marker
  float radius;
  float h, s, b, a;
  color paint;
  
  Particle(){
    // location init
    // position particles on a random point on a circle
    float theta = random(TAU);
    float r = random(width*.4);
    float originX = width/2;
    float originY = height/2;
    
    x = originX + cos(theta)*r;
    y = originY + sin(theta)*r;
    
    // movement init
    speed = random(speedMin, speedMax);
    jitter = random(jitterMin, jitterMax);
    turniness = random(turninessMin, turninessMax);
    
    // marker init
    radius = random(radMin, radMax);
    h = (hueMin + random(hueRange)) % TAU;
    s = random(satMin, satMax);
    b = random(briMin, briMax);
    b = 1;
    a = random(alpMin, alpMax);
    paint = color(h, s, b, a);
    
    // eraser particles
    if(random(1) < eraserChance){
      // pick a corner
      float corner = random(1);
      if(corner < 0.25){
        x = width/2;
        y = 0;
      } else if (corner < 0.5){
        x = width;
        y = height/2;
      } else if (corner < 0.75){
        x = width/2;
        y = height;
      } else {
        x = 0;
        y = height/2;
      }
      
      speed = 1;
      jitter = 1;
      turniness = 1;
      //radius *= 0.1;
      paint = color(0, 0, 1.0, .3);
    }
  }
  
  void update(){
    // location + movement update
    float n = noise(x * xWarp,
                    y * yWarp,
                    frameCount * tWarp);
    float angle = n * TAU * turniness + dir;
    x += cos(angle) * speed * random(jitter);
    y += sin(angle) * speed * random(jitter);
    
   
    
    // marker update
    noStroke();
    fill(paint);
    circle(x, y, radius * random(jitter));
  }
  
}
