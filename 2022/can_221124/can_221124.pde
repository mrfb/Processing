// 2022-11-24 (thu) - can
// optional constraint: make something asymmetric

int numCircles = 4;

PVector center;
float minSize = 32;
float maxSize = 128;
PVector[] circles;
float[] offsets;

PVector
  anchorA, controlA,
  anchorB, controlB;

float progress = 0;
float progressStep = 0.01;

boolean saveFrames = true;
boolean dev = false;

void setup() {
  size(1024, 1024);
  frameRate(50);

  center = new PVector(0, 0);

  circles = new PVector[numCircles];
  offsets = new float[numCircles];

  anchorA = new PVector();
  controlA = new PVector();
  anchorB = new PVector();
  controlB = new PVector();

  for (int i = 0; i < numCircles; i++) {
    offsets[i] = random(TAU);
    circles[i] = new PVector();
  }
}

void draw() {
  background(#c0fc1e);
  noFill();
  //strokeCap(SQUARE);

  // anchorA
  circles[0].x = width / 3;
  circles[0].y = height / 3;
  circles[0].z = width / 6.2;

  // controlA
  circles[1].x = 256;
  circles[1].y = 640;
  circles[1].z = 223;

  // anchorB
  circles[2].x = width / 3 * 2;
  circles[2].y = width / 3 * 2;
  circles[2].z = width / 3.1;

  // controlB
  circles[3].x = 512;
  circles[3].y = 256;
  circles[3].z = 128;

  if (dev) {
    strokeWeight(1);
    for (int i = 0; i < numCircles; i++) {
      // using z as width
      stroke(#ff0000);
      circle(circles[i].x, circles[i].y, circles[i].z * 2);
      PVector offset = PVector.fromAngle(offsets[i] + progress * TAU).mult(circles[i].z);
      stroke(#00ff00);
      line(circles[i].x, circles[i].y,
        circles[i].x + offset.x, circles[i].y + offset.y);
    }
  }

  for (float i = 0; i < TAU * 0.5; i += TAU * 0.01) {
    anchorA.set(
      circles[0].x + circles[0].z*cos(offsets[0] + progress * TAU + i),
      circles[0].y + circles[0].z*sin(offsets[0] + progress * TAU + i));
    controlA.set(
      circles[1].x + circles[1].z*cos(offsets[1] + progress * TAU + i),
      circles[1].y + circles[1].z*sin(offsets[1] + progress * TAU + i));
    anchorB.set(
      circles[2].x + circles[2].z*cos(offsets[2] + progress * 2 * TAU + i),
      circles[2].y + circles[2].z*sin(offsets[2] + progress * 2 * TAU + i));
    controlB.set(
      circles[3].x + circles[3].z*cos(offsets[3] + progress * TAU + i),
      circles[3].y + circles[3].z*sin(offsets[3] + progress * TAU + i));

    if (dev) {
      stroke(#0000ff);
      strokeWeight(1);
      line(anchorA.x, anchorA.y, controlA.x, controlA.y);
      line(anchorB.x, anchorB.y, controlB.x, controlB.y);
    }

    strokeWeight(1);
    stroke(#ea09e4);
    bezier(anchorA.x, anchorA.y, controlA.x, controlA.y,
      controlB.x, controlB.y, anchorB.x, anchorB.y);
  }

  progress += progressStep;

  if (saveFrames && progress < 1) {
    saveFrame("frames/####.png");
  } else if (progress > 1) {
    // reset the progress counter if we make a full loop
    progress %= 1;
    saveFrames = false;
    println(frameCount + ": looped");
  }
}
