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
  
  threeByThree();
  
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

void threeByThree(){
  float r = 111; // give a little wiggle room
  resist.rect(0, 0, width*.25-r, height);
  resist.rect(width*.25+r, 0, width*.5-r, height);
  resist.rect(width*.5+r, 0, width*.75-r, height);
  resist.rect(width*.75+r, 0, width, height);
  
  resist.rect(0, 0, width, height*.25-r);
  resist.rect(0, height*.25+r, width, height*.5-r);
  resist.rect(0, height*.5+r, width, height*.75-r);
  resist.rect(0, height*.75+r, width, height);
}
