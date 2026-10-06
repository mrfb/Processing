// just some random walk particle jittering, but
// intended to show up on a dark or light
// mode discord background so that
// one of the two colors don't show up

color dark = #36393e;
color light = #ffffff;

float[] sizes;
float[] xs;
float[] ys;
color[] fills;

int numParticles = 150;

float speed = 1.5;
float size = 50;
 
PGraphics c;

void setup(){
  size(666, 666);
  c = createGraphics(666, 666);
  noStroke();
  
  sizes = new float[numParticles];
  xs = new float[numParticles];
  ys = new float[numParticles];
  fills = new color[numParticles];
  
  for(int i = 0; i < numParticles; i++){
    sizes[i] = random(size);
    xs[i] = random(c.width);
    ys[i] = random(c.height);
    fills[i] = (random(1)<0.5) ? light : dark;
  }
  background(dark);
}

void draw(){
  c.beginDraw();
  c.noStroke();
  for(int i = 0; i < numParticles; i++){
    c.fill(fills[i]);
    c.ellipse(xs[i], ys[i], sizes[i], sizes[i]);
    
    xs[i] += random(-speed, speed);
    ys[i] += random(-speed, speed);
    
    if(random(1) < 0.01){
      xs[i] += random(-speed * 100, speed * 100);
      ys[i] += random(-speed * 100, speed * 100);
    }
    
  }
  c.endDraw();
  
  background(128);
  image(c, 0, 0);
  
  if(frameCount % 1000 == 0){
    c.save(frameCount + ".png");
    println("saved " + frameCount + ".png");
  }
}
