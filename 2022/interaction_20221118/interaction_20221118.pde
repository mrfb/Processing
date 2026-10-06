PVector position;
int charSize = 100;
float charRotation = 0;
float speed = 3.0;
float rotSpeed = TAU/100;

boolean rolling = false;

PImage david;

void setup(){
  size(500, 500);
  position = new PVector(width/2, height/2);
  rectMode(CENTER);
  david = loadImage("david.png");
}

void draw(){
  noStroke();
  fill(0, 25);
  rect(width/2, height/2, width, height);
  
  // draw the character at the current position
  fill(255);
  stroke(0);
  translate(position.x - charSize/2, position.y - charSize/2);
  rotate(charRotation);
  image(david, -charSize/2, -charSize/2, charSize, charSize);
  
  // check for input and update the position accordingly
  if(keyPressed){
    println(frameCount + ": a key is being pressed");
    
    if(key == 'w' || key == 'W'){
      println("  goin' up!");
      position.y -= speed;
    }
    
    if(key == 'a' || key == 'A'){
      println("  goin' left!");
      position.x -= speed;
    }
    
    if(key == 's' || key == 'S'){
      println("  goin' down!");
      position.y += speed;
    }
    
    if(key == 'd' || key == 'D'){
      println("  goin' right!");
      position.x = position.x + speed;
    }
    
    if(key == ' '){
      println("  rollin, rollin, rollin");
      rolling = true;
    }
    
  }
  
  // roll until we do one quarter turn then stop
  if(rolling){
    charRotation += rotSpeed;
    
    if(TAU - charRotation < .001){
      charRotation = 0;
      rolling = false;
    }
  }
  
}
