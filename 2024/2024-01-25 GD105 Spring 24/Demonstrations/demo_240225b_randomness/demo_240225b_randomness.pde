PVector pos;
float r, g, b;
color col;
float theta = 0;

// a long is an integer with more storage
// this seed is the current date and time
// (2024/02/25 @ 3:59PM)
long seed = 202402251559L;

void setup(){
  size(1024, 1024);
  pos = new PVector(width/2, height/2);
  r = 255; // #ffbf00: https://youtu.be/s45uNTiYkZU
  g = 191;
  b = 0;
  
  background(255);
  strokeWeight(2);
  noSmooth();
  rectMode(CENTER);
  
  randomSeed(seed);
}

void draw(){  
  // draw the circle
  col = color(r, g, b);
  fill(col);
  translate(pos.x, pos.y);
  rotate(theta);
  square(0, 0, 20);
  
  // update position, color, and rotation for the next frame
  pos.x += random(-6, 6);
  pos.y += random(-6, 6);
  
  r += random(-5, 5);
  g += random(-5, 5);
  b += random(-5, 5);
  
  theta += random(-0.01, 0.01);
  
  // constrain values to valid ones
  pos.x = constrain(pos.x, 0, width);
  pos.y = constrain(pos.y, 0, height);
  
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);
  
  theta = constrain(theta, 0, TAU);
  
  // automatically saves an image every 1000 frames
  if(frameCount % 1000 == 0){
    outputImage();
  }
}

// also saves an image whenever we click
void mouseClicked(){
  outputImage();
}

void outputImage(){
  String filename = seed+"_fr"+frameCount+".png";
  save("output/" + filename);
  println("saved as " + filename);
}
