Turtle rertle, gertle, bertle;

void setup(){
  size(666, 666);
  background(255);
  rertle = new Turtle(width * 0.50, height * 0.25);
  gertle = new Turtle(width * 0.50, height * 0.50);
  bertle = new Turtle(width * 0.50, height * 0.75);
  
  rertle.ink = #aa0000;
  gertle.ink = #00aa00;
  bertle.ink = #0000aa;
  
  noSmooth();
  //frameRate(5);
}

void draw(){
  
  //rertle.walk(5);
  //rertle.turn(radians(1 - dist(rertle.position.x, rertle.position.y, width/2, height/2) / 200));
  
  //gertle.walk(5);
  //gertle.turn(radians(3 - dist(gertle.position.x, gertle.position.y, width/2, height/2) / 200));
  
  bertle.walk(5);
  bertle.turn(radians(5 - dist(bertle.position.x, bertle.position.y, width/2, height/2) / 200));
}
