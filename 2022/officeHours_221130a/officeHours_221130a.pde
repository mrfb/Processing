void setup(){
  // called once at the beginning
  size(800, 800); 
  strokeWeight(4);
}

void draw(){
  background(255);
  // called once per frame
  translate(width/2, height);
  
  float fluctuationY = sin(frameCount * .1) * 45;
  float fluctuationX = cos(frameCount * .1) * 3;
  
  float height0 = 0;
  float height1 = height0 - 50 + fluctuationY;
  float height2 = height1 - 50 + fluctuationY;
  float height3 = height2 - 50 + fluctuationY;
  
  float radius = 25 + fluctuationX;
  
  line(-radius, height0, radius, height1);
  line(radius, height0, -radius, height1);
  
  line(-radius, height1, radius, height2);
  line(radius, height1, -radius, height2);
  
  line(-radius, height2, radius, height3);
  line(radius, height2, -radius, height3);
 
  
  
}
