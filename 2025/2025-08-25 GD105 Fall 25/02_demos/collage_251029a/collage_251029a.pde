PImage bg;
PImage horse;

void setup(){
  size(1280, 720);
  
  bg = loadImage("hell.jpg");
  horse = loadImage("horse-bg.png");
  horse.resize(int(horse.width * 0.25), int(horse.height * 0.25));
}

void draw(){
  image(bg, 0, 0);
  image(horse, 1206 - frameCount, 453);
}
