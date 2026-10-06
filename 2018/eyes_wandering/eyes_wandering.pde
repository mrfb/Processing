int numCircles;
Circle[] circles;
Eye[] eyes;
int[] intersections;
float driftSpeed;
boolean thresh = false;
boolean showIntersections = true;
boolean eyesPlaced = false;

void setParameters(){
  numCircles = (int)random(1,8) * 2;
  numCircles = 15;
  driftSpeed = 0.05;
}

void setup(){
  size(666,666);
  colorMode(HSB, 1.0);
  textAlign(CENTER);
  ellipseMode(CENTER);
  background(0);
  setParameters();
  
  circles = new Circle[numCircles];
  eyes = new Eye[numCircles];
  intersections = new int[numCircles];
  for(int i = 0; i < numCircles; i++){
    circles[i] = new Circle();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < numCircles; i++){
    if(eyesPlaced){
      eyes[i].draw();
    } else {
      circles[i].draw();
    }
  }
  
  // calculate intersections
  for(int i = 0; i < numCircles; i++){
    intersections[i] = 0;
    for(int j = 0; j < numCircles; j++){
      if(i == j) continue;  // no need to check against self
      float d = PVector.dist(circles[i].pos, circles[j].pos);
      if(abs(d) < circles[i].r + circles[j].r){
        intersections[i] += 1;
      }
    }
    if(showIntersections){
      text(intersections[i], circles[i].pos.x, circles[i].pos.y);
    }
    if(intersections[i] == 0){
      if(circles[i].acc.mag() != 0){
        circles[i].vel = PVector.random2D().mult(driftSpeed);
      }
      circles[i].acc.mult(0);
    } else {
      circles[i].acc = PVector.random2D();
    }
  }
  if(thresh) filter(THRESHOLD);
}

void keyPressed(){
  if(key == ' '){
    thresh = !thresh;
    showIntersections = !showIntersections;
  } else if (key == 'i'){
    eyesPlaced = !eyesPlaced;
    openEyes();
  } else {
    for(int i = 0; i < numCircles; i++){
      circles[i].pos = new PVector(width/2, height/2);
      circles[i].acc = PVector.random2D();
    }
  }
}
