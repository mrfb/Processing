boolean lightMode;
boolean correct;
int copies;

color paper, ink;

void setup(){
  size(1024, 1024);
  
  lightMode = random(1) < 0.95; // 95% chance
  //lightMode = true;
  println("lightMode:", lightMode);
  
  correct = random(1) < 0.50; // 50% chance
  //correct = true;
  println("correct:", correct);
  
  // random(0, 3) => [0..3)
  // int([0..3)) => {0, 1, 2}
  // {0, 1, 2} + 1 => {1, 2, 3}
  copies = int(random(0, 3)) + 1;
  //copies = 3;
  println("copies:", copies);
  
  paper = lightMode ? #ffffff : #000000;
  
  if(lightMode){
    // light mode
    ink  = #000000; // black
  } else if (correct) {
    // dark mode and correct
    ink = #00ff00; // green
  } else {
    // dark mode and incorrect
    ink = #ff0000; // red
  }
  
}

void draw(){
  background(paper);
  stroke(ink);
  noFill();
  strokeWeight(5);
  
  // intentionally lacking break statements
  switch(copies){
    case 3:
      drawShape(width * .25, height * .25, width * .15);
    case 2: 
      drawShape(width * .50, height * .50, width * .15);
    case 1:
      drawShape(width * .75, height * .75, width * .15);
  }
  
  if(frameCount == 1){
    saveImage();
  }
}

void drawShape(float x, float y, float radius){
  if(correct){
    circle(x, y, radius * 2);
  } else {
    line(x - radius, y - radius, x + radius, y + radius);
    line(x - radius, y + radius, x + radius, y - radius);
  }
}

void saveImage(){
  String name = "";
    
  // equivalent to ternary statements below
  //if(lightMode){
  //  name += "1";
  //} else {
  //  name += "0";
  //}
  
  name += lightMode ? "1" : "0";
  name += correct ? "1" : "0";
  name += copies;
  
  save(name + ".png");
  println("saved as " + name + ".png");
}
