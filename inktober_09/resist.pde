void drawResist(){
  resist.beginDraw();
  resist.colorMode(RGB, 1.0);
  resist.fill(#ff0000);
  resist.ellipseMode(CENTER);
  resist.rectMode(CORNERS);
  resist.stroke(#ff0000);
  resist.strokeWeight(20);
  
  if(resistImage != ""){
    println("loading resist: " + resistImage);
    resist.image(loadImage(resistImage), 0,0);
  }
  
  //diamondGrid();
  
  resist.endDraw();
  
  if(resistImage == ""){
    resist.save("resist.png");
  }
}

void diamondGrid(){
  for(int i = 0; i <= 16; i++){
    resist.line(i * 90.0, 0, i * 90.0, height);
  }
  
  for(int i = 0; i <= 10; i++){
    resist.line(0, i * 90.0, width, i * 90.0);
  }
}
