void drawResist(){
  resist.beginDraw();
  resist.colorMode(RGB, 1.0);
  resist.fill(#ff0000);
  resist.ellipseMode(CENTER);
  resist.rectMode(CORNERS);
  resist.noStroke();
  
  if(resistImage != ""){
    println("loading resist: " + resistImage);
    resist.image(loadImage(resistImage), 0,0);
  }
  
  //resist.ellipse(width/2, height/2, 2 * wreathSize, 2 * wreathSize);
  
  //resist.textSize(200);
  //resist.textAlign(CENTER, CENTER);
  //resist.text("BUTTS BUTTS BUTTS BUTTS BUTTS BUTTS", 0, 0, width, height);
  
  
  //for(int row = 0; row < 10; row++){
  //  resist.fill(1, 0, 0, .1 * row * .1 * row);
  //  resist.rect(0, height * (.1 * row), width, height);
  //}
  
  resist.endDraw();
  
  if(resistImage == ""){
    resist.save("resist.png");
  }
}
