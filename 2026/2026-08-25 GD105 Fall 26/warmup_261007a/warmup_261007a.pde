// Matthew R.F. Balousek
// 2026-10-07
// Morning noodle warmup while waiting for GD105 to start.

size(1000,1000);
background(#FFFFFF);

// Draws a kind of sunburst
int linesDrawn = 0;
stroke(#FBFF00, 100);
translate(width/2, height/2);
while(linesDrawn < 51){
  line(-random(width * 0.12, width * 0.35), 0,
       -random(width * 0.36, width * 0.48), 0);
  rotate(TAU/100);
  linesDrawn++;
}

noStroke();

fill(#FBFF00);
circle(0, 0, width * 0.11);

resetMatrix();
fill(#000000);
rect(0, height/2, width, height/2);

fill(#FFFFFF);
PFont f = loadFont("AdobeArabic-Italic-96.vlw");
textFont(f);
textAlign(CENTER);
text("Wake up every day.\n\n...except Saturdays.", width * .50, height * 0.65);
