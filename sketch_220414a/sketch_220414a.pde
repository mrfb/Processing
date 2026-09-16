/**
 * Linear Interpolation. 
 * 
 * Move the mouse across the screen and the symbol will follow.  
 * Between drawing each frame of the animation, the ellipse moves 
 * part of the distance (0.05) from its current position toward 
 * the cursor using the lerp() function.
 */
 
float x;
float y;

void setup() {
  size(640, 360); 
  strokeWeight(10);  
}

void draw() { 
  background(151);
  
  // lerp() calculates a number between two numbers at a specific increment. 
  // The amt parameter is the amount to interpolate between the two values 
  // where 0.0 equal to the first point, 0.1 is very near the first point, 0.5 
  // is half-way in between, etc.  
  
  // Here we are moving 5% of the way to the mouse location each frame
  x = lerp(x, mouseX, 0.05);
  y = lerp(y, mouseY, 0.05);
  
  fill(lerp(0, 255, x/(float)width), 0, lerp(0, 255, y/(float)height));
  stroke(0, lerp(255, 0, x/(float)width), lerp(255, 0, y/(float)height));
  ellipse(x, y, 66, 66);
}
