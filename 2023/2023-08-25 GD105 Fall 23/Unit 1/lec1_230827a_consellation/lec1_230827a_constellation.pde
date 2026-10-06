// this program makes a simple smily face
// using points and lines
// see: https://mbalousek.notion.site/105-Lec-01-Getting-Started-b7d4155b87f8456292fd46160496474b?pvs=4
// — mrfb 2023-08-27

void setup() {
  size(1024, 1024);
}

void draw() {
  // having background in draw() means we don't see
  // the old lines, particularly in tweak mode
  
  // white paper, black ink
  background(255);
  stroke(0);

  // define all the points
  PVector leftEye = new PVector(200, 250);
  PVector rightEye = new PVector(800, 250);
  PVector mouth1 = new PVector(150, 550);
  PVector mouth2 = new PVector(500, 750);
  PVector mouth3 = new PVector(850, 550);

  // draw the eyes using the eye points
  strokeWeight(30);
  point(leftEye.x, leftEye.y);
  point(rightEye.x, rightEye.y);
  
  // draw the mouth using the mouth points
  strokeWeight(10);
  line(mouth1.x, mouth1.y, mouth2.x, mouth2.y);
  line(mouth2.x, mouth2.y, mouth3.x, mouth3.y);
  
  // this saves the canvas on the first frame
  // so we can get a clean image of the output easily
  if(frameCount == 1) {
    String filename = "output";
    save(filename + ".png");
    print("canvas saved as " + filename + ".png");
  }
}
