// Matthew R.F. Balousek
// 2026-10-07
// Quick rotation demo for GD105.

size(1000,1000); // Setup canvas
background(255);

fill(0); // Setup style
noStroke();
rectMode(CENTER);

// Transform before drawing
translate(width * .5, height * .5);
rotate(TAU * 1 / 8.0); // 1/8th of a turn = 1/8th of TAU
//rotate(radians(45)); // equivalent, but frowned upon
square(0, 0, width * .15);

// A few more for ornamentation -- no need to adjust transforms
square(width * .15, 0, width * .05);
square(-width * .15, 0, width * .05);
square(0, height * .15, width * .05);
square(0, -height * .15, width * .05);
