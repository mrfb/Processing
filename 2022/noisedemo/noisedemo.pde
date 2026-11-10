void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  float noiseZoom = 100;
  // this is a nested for loop
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // noise generates a number between 0 and 1
      // based on the coordinates we give it
      // so we map that to a color
      // https://processing.org/reference/noise_.html
      stroke(noise(x / noiseZoom, y / noiseZoom) * 255);
      // and then put a pixel of that color where we are
      point(x, y);
    }
  }
}
