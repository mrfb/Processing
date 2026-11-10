// general setup
size(500, 500);
background(#FFFFFF);
noStroke();
translate(250, 250);

// draw our central circle
fill(#000000);
circle(0, 0, 200);

// draw circles around the central one
colorMode(HSB, TAU, 100, 100);

fill(TAU * (0.0/8.0), 10, 100);
circle(175, 0, 100);

rotate(TAU / 8);
fill(TAU * (1.0/8.0), 10, 100);
circle(175, 0, 100);

rotate(TAU / 8);
fill(TAU * (2.0/8.0), 10, 100);
circle(175, 0, 100);

rotate(TAU / 8);
fill(TAU * (3.0/8.0), 10, 100);
circle(175, 0, 100);

rotate(TAU / 8);
fill(TAU * (4.0/8.0), 10, 100);
circle(175, 0, 100);

rotate(TAU / 8);
fill(TAU * (5.0/8.0), 10, 100);
circle(175, 0, 100);

rotate(TAU / 8);
fill(TAU * (6.0/8.0), 10, 100);
circle(175, 0, 100);

rotate(TAU / 8);
fill(TAU * (7.0/8.0), 10, 100);
circle(175, 0, 100);

// save what we did
save("output.png");
