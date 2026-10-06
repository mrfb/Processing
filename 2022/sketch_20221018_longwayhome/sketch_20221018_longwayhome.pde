// 20221018 - the long way home

color paper = #FCFCF2;
color ink = #113750;

float x, y, px, py;
float size = 5;
float speed = size * .4;

float workX, workY;
float homeX, homeY;

void setup(){
  size(666, 666);
  background(paper);
  fill(ink);
  stroke(ink);
  
  workX = random(width*.1, width*.9);
  workY = random(0, height/2);
  
  homeX = random(width*.1, width*.9);
  homeY = random(height/2, height);
  
  x = workX;
  y = workY;
  
  line(workX-10, workY-10, workX+10, workY+10);
  line(workX+10, workY-10, workX-10, workY+10);
  line(homeX-10, homeY-10, homeX+10, homeY+10);
  line(homeX+10, homeY-10, homeX-10, homeY+10);
}

// make a turtle that wanders the page
// ending when it reaches home
// random walk, weighted right and to the left
void draw(){
  px = x;
  py = y;
  // x and y each take somewhere between
  // two steps forward and one step back
  if(x < homeX){
    x += random(-1 * speed, 2 * speed);
  } else {
    x -= random(-1 * speed, 2 * speed);
  }
  
  if(y < homeY){
    y += random(-1 * speed, 2 * speed);
  } else {
    y -= random(-1 * speed, 2 * speed);
  }
  
  //strokeWeight(size);
  stroke(ink);
  line(px, py, x, y);
  noStroke();
  ellipse(x, y, size, size);
  
  if(x - homeX < 5 && x - homeX > -5
     && y - homeY < 5 && y - homeY > -5){
    noLoop();
    save("longwayhome.png");
    println("I'm home!");
  }
}
