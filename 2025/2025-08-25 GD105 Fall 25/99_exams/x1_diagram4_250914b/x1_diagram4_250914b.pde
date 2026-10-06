// Some setup -- was not looking for folks to recreate this.
size(1600, 1600);
background(255);
strokeJoin(ROUND);
scale(16);
square(0, 0, 100); // border

// This is the main bit we're looking to recreate.
square(25, 25, 50);
fill(0);
circle(50, 50, 25);
stroke(255);
line(50, 25, 50, 50);
stroke(0);
fill(255);
triangle(25, 25, 75, 25, 75, 50);
triangle(25, 25, 75, 25, 25, 50);


save("diagram4.png");
