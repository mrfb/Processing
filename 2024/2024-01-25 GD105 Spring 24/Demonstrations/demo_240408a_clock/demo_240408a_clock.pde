// let's make a weird clock

void setup(){
  size(666, 666); // hail the dark lord, who protects our code
  noSmooth();     // just 'cuz
}

void draw(){
  // 0% at midnight, 100% at just before midnight
  float pctTime = ((hour()*3600 + minute()*60 + second()) / 86400.0) * 100000;
  
  // mapping seconds and minutes to a greyscale color
  float secondMapped = map(second(), 0, 59, 0, 255);
  float minuteMapped = map(minute(), 0, 59, TAU * 0.75, TAU * 1.75);
  float clockRadius = width/2 - 65;
  
  // background starts at black and becomes brighter as the minute rolls over
  background(secondMapped);
  
  // draw our frame circles
  noFill();
  strokeWeight(1);
  stroke(255 - secondMapped);
  circle(width/2, height/2, clockRadius * 2);
  circle(width/2 + cos(minuteMapped) * clockRadius, // x
         height/2 + sin(minuteMapped) * clockRadius, // y
         65);
  
  // draw the minute hand orbiting
  fill(255 - secondMapped); // inverse of the background
  circle(width/2 + cos(minuteMapped) * clockRadius, // x
         height/2 + sin(minuteMapped) * clockRadius, // y
         second() + 4); // size
  
  // draw the current time as a % of the total day
  // to three digits, so it's generally moving
  // TODO: add trailing 0s for consistency
  textAlign(CENTER, CENTER);
  textSize(128);
  text(int(pctTime)/1000.0 + "%", width/2, height/2);
}
