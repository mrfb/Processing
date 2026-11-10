color sky = #4287f5;
color ground = #4b822f;
color house = #fc194e;
color roof = #472e24;
color clouds = 0x44ffffff;
color lightsOff = #382527;
color lightsOn = #fdffbd;
boolean lights = true;

void setup(){
  size(666, 666);
  frameRate(15);
}

void draw(){
  drawBackdrop();
  drawHouse();
  drawClouds();
  
  //fill(255);
  //String coordinates = "(" + mouseX + ", " + mouseY + ")";
  //text(coordinates, mouseX, mouseY);
}

void drawClouds(){
  fill(clouds);
  float cloudX = width*.15;
  float cloudY = height*.10;
  float cloudWidth = 150;
  float cloudHeight = 50;
  float chunkSize = 10;
  int numClouds = 500;
  // Draw one cloud.
  for(int i = 0; i < numClouds; i++){
    circle(cloudX + random(cloudWidth), cloudY + random(cloudHeight), 10+random(chunkSize));
  }
  
  // Draw a second, smaller cloud.
  for(int i = 0; i < numClouds*.5; i++){
    circle(cloudX + 400 + random(cloudWidth - 40), cloudY + 50 + random(cloudHeight - 20), 10+random(chunkSize));
  }
  
  // Draw a third, bigger cloud.
  for(int i = 0; i < numClouds*2; i++){
    circle(cloudX + 100 + random(cloudWidth + 20), cloudY + 120 + random(cloudHeight + 10), 10+random(chunkSize));
  }
  
}

void drawBackdrop(){
  // Draw the sky in the background.
  background(sky);
  
  // Draw the ground.
  fill(ground);
  noStroke();
  rect(0, height*.75, width, height*.25);
  
  //println("Backdrop drawn!");
  return;
}

void drawHouse(){
  // Draw a house.
  float houseX = width*.5;
  float houseY = height*.7;
  int houseSize = 120;
  fill(house);
  rectMode(RADIUS);
  square(houseX, houseY, houseSize/2);
  
  fill(roof);
  triangle(houseX,              houseY-houseSize*1.2,
           houseX+houseSize*.8, houseY-houseSize*.5,
           houseX-houseSize*.8, houseY-houseSize*.5);
           
  if(lights){
    fill(lightsOn);
  }else{
    fill(lightsOff);
  }
  square(houseX-30, houseY-30, houseSize/5);
  square(houseX+30, houseY-30, houseSize/5);
           
  rectMode(CORNER);
  //println("House drawn!");
  return;
}

void mouseClicked(){
  lights = !lights;
  println("mouseX: " + mouseX + "; mouseY: " + mouseY);
}
