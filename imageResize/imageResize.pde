PImage cat;

void setup(){
  size(600, 600);
  cat = loadImage("ravioli.png");
}

void draw(){
  background(255);
  
  translate(300, 150);
  line(-9999, 0, 9999, 0);
  line(0, -9999, 0, 9999);
  
  rotate(sin(frameCount*.03)*.24);
  line(-100, 50, 0, 0);
  line(0, 0, 100, 50);
  image(cat, -100, 50, 200, 200);
  
  if(frameCount <= 100){
    saveFrame("frames/####.png");
  }
}
