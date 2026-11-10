PImage apple;
PImage someDude;

void setup() {
  size(612, 868);
  
  // load our images
  apple = loadImage("apple.png");
  someDude = loadImage("someDude.jpg");
}

void draw() {
  // draw the image
  image(someDude, 0, 0);
  
  // our apple is very big, so...
  translate(225, 159);
  scale(0.08); // shrink it!
  rotate(-0.32);
  image(apple, 0, 0);
}

void mouseClicked() {
  save("output.png");
  println(frameCount + ": saved as output.png");
}
