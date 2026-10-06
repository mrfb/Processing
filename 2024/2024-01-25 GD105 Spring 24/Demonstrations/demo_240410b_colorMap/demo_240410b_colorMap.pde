void setup(){
  size(666, 666);
}

void draw(){
  background( map(mouseX, 0, width, 0, 255),
              map(mouseY, 0, height, 0, 255),
              0
              );
}
