// reminder: you do NOT need to do for loops
// and transforms for this first assignment
// if it is confusing—leave it. walk before you run.

import processing.svg.*;

size(800, 800);
background(255); // "gesso" the background white

beginRecord(SVG, "plot.svg");

translate(width/2, height/2); // move (0, 0) to the center

int rotation = 10; // rotate 10° between each line
// we're gonna make a full circle
for(int i = 0; i < 360; i+=rotation){
  line(50, 0, random(100, 350), 0); // draw a line to the right
  rotate(radians(rotation)); // turn a bit
  // and then repeat until we finish the circle
}

circle(0, 0, 75);

endRecord();
