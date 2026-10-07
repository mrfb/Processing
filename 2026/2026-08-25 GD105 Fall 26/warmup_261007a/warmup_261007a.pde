// Matthew R.F. Balousek
// 2026-10-07
// Morning noodle warmup while waiting for GD105 to start.

size(1000,1000);
background(#FFFFFF);

// Draws a kind of sunburst
// these low-opacity yellow lines stacked on top of each
// other create a kind of gradient effect
int linesDrawn = 0;
stroke(#FBFF00, 2);
strokeWeight(5);
translate(width/2, height/2);
while(linesDrawn < 10000){
  line(-random(width * 0.15, width * 0.35), 0,
       -random(width * 0.36, width * 0.48), 0);
  rotate(TAU/100);
  linesDrawn++;
}

noStroke();
fill(#FBFF00);
circle(0, 0, width * 0.11);

resetMatrix();
fill(#000000);
rect(0, height * .51, width, height/2); // a skosh low to show the sunbeams

PFont f = loadFont("AdobeArabic-Italic-96.vlw");
textFont(f);
textAlign(CENTER);

fill(#FFFFFF);
text("Wake up every day.", width * .50, height * 0.65);

fill(#333333);
text("...except Saturdays.", width * .50, height * 0.85);

save("output.png");
