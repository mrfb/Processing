// Set the size to 500 pixels in both directions.
size(500, 500);

// Draw a square with a fill and an outline.
stroke(255);
strokeWeight(5);
fill(0, 0, 0); // set the fill to black
square(50, 50, 100);

// Draw a square without a fill.
noFill();
square(300, 100, 50);

// Draw a square without an outline.
noStroke();
fill(0);
square(100, 300, 150);
