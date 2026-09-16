/**
 * Primitives 3D.
 *
 * Placing mathematically 3D objects in synthetic space.
 * The lights() method reveals their imagined dimension.
 * The box() and sphere() functions each have one parameter
 * which is used to specify their size. These shapes are
 * positioned using the translate() function.
 */

void setup() {

  size(640, 360, P3D);
  
}

void draw() {
  background(0);
  fill(255);
  lights();
  
  noStroke();
  pushMatrix();
  translate(0, 0, 0);
  rotateY(0.00);
  rotateX(0.00);
  box(100);
  popMatrix();

  noFill();
  stroke(255);
  pushMatrix();
  translate(500, height*0.35, -200);
  sphere(280);
  popMatrix();
}
