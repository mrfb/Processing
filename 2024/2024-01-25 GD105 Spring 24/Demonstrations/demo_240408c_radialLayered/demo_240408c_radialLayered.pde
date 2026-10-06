// little layered drawing demo

void setup(){
  //size(1024, 1024);
  fullScreen(2);
  background(0);
  noSmooth();
  noStroke();
  colorMode(HSB, 255, 100, 100);
}

// polar coordinates
// slowly increase theta, draw a square at a random r
void draw(){
  translate(width/2, height/2);
  rotate(frameCount * 0.001);
  if(random(1) < 0.1){
    fill(color(random(255), 100, 100));
  } else {
    fill(random(1)<0.5?0:255);
  }
  square(random(width * 0.7), 0, random(32, 64));
}
