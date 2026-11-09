void mousePressed(){
  int red = int(map(mouseY, 0, height, 255, 0));
  int blue = int(map(mouseX, 0, width, 0, 255));
  
  fill(color(red, 0, blue));
}

void mouseDragged(){
  //line(pmouseX, pmouseY, mouseX, mouseY);
  text(brush, mouseX, mouseY);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  penSize += e;
  penSize = constrain(penSize, 8, 128);
  textSize(penSize);
}
