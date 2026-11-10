void setup(){
  size(1000, 1000);
  background(#ffffff);
  image(loadImage("images/alphonse.png"), 0, 0);
}

void draw(){
  fill(random(0, 120), random(120, 240), random(120, 240), random(255));
  stroke(random(120, 240), random(0, 120), random(120, 240), random(255));
  translate(mouseX + random(-20, 20), mouseY + random(-20, 20));
  circle(0, 0, random(50));
}

// These two sorting methods will have wildly different results!
void keyPressed(){
  //sortRows();
  sortCanvas();
  save(frameCount + ".png");
}

void sortCanvas(){
  loadPixels();
  color[] sorted = new color[pixels.length];
  color[] unsorted = new color[pixels.length];
  for(int i = 0; i < pixels.length; i++){
    unsorted[i] = pixels[i];
  }
  sorted = sort(unsorted);
  for(int i = 0; i < pixels.length; i++){
    pixels[i] = sorted[i];
  }
  updatePixels();
}

void sortRows(){
  color[] unsorted = new color[width];
  color[] sorted = new color[width];
  loadPixels();
  
  for(int row = 0; row < height; row++){
    // Load up pixels.
    for(int i = 0; i < width; i++) {
      unsorted[i] = pixels[row*width + i];
    }
    // Sort pixels.
    sorted = sort(unsorted);
    // Save back pixels.
    for(int i = 0; i < width; i++) {
      pixels[row*width + i] = sorted[i];
    }
  }
  
  updatePixels();
}
