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
  
  //resist.ellipse(width/2, height/2, 2 * wreathSize, 2 * wreathSize);
  
  // 90px tiles: 16 across, 10 down
  
  
  for(int i = 0; i <= 16; i++){
    resist.line(i * 90.0, 0, i * 90.0, height);
  }
  
  for(int i = 0; i <= 10; i++){
    resist.line(0, i * 90.0, width, i * 90.0);
  }
  
  resist.endDraw();
  
  if(resistImage == ""){
    resist.save("resist.png");
  }
}
