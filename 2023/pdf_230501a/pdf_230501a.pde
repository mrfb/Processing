import processing.pdf.*;

void setup() {
  size(400, 400);
  noLoop();
  beginRecord(PDF, "output.pdf");
}

void draw() {
  // Draw something good here
  line(0, 0, width/2, height);

  endRecord();
}
