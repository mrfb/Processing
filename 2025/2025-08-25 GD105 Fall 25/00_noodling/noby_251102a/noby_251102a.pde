color[] rColor;

void setup() {
  rColor = new color[800];
  for (int i = 0; i < rColor.length; i++) {
    rColor[i] = color(random(180, 255), random(180, 255), random(180, 255));
  }
  noStroke();
  size(1024, 1024);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i = 0; i < rColor.length; i++) {
    fill(rColor[i]);
    float radius = map(sin((frameCount + i) * 0.03), -1, 1, width * 0.15, width * 0.45);
    circle(cos(radians(i) + (frameCount * 0.01)) * radius,
           sin(radians(i) + (frameCount * 0.01)) * radius,
           50);
  }
  
  if(frameCount == 1) save("sample.png");
}
