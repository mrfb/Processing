PGraphics pg = createGraphics(100,100);

size(200, 200);
// Before we deal with pixels
pg.beginDraw();
pg.loadPixels();  
// Loop through every pixel
for (int i = 0; i < pg.pixels.length; i++) {
  // Pick a random number, 0 to 255
  float rand = random(255);
  // Create a grayscale color based on random number
  color c = color(rand);
  // Set pixel at that location to random color
  pg.pixels[i] = c;
}

color[] unsorted = new color[pg.width];
color[] sorted = new color[pg.width];

for(int row = 0; row < pg.height; row++){
  // Load up pixels.
  for(int i = 0; i < pg.width; i++) {
    unsorted[i] = pg.pixels[row*pg.width + i];
  }
  // Sort pixels.
  sorted = sort(unsorted);
  // Save back pixels.
  for(int i = 0; i < pg.width; i++) {
    pg.pixels[row*pg.width + i] = sorted[i];
  }
}

// When we are finished dealing with pixels
pg.updatePixels();
pg.endDraw();

image(pg, 50, 50);
