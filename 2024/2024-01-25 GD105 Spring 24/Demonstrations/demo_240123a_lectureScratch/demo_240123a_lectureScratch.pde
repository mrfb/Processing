PFont futura;

String topText = "what were to happen";;
String bottomText = "if pinocchio said his nose\nwould grow";

// this code is not commented because i am talking
// as i program on a recording -- this is not an advisable practice
void setup() {
  size(1024, 1024);
  futura = loadFont("Futura-MediumItalic-80.vlw");
  
  textAlign(CENTER, CENTER);
  textFont(futura);
  fill(#fa3131, 50);
}

void draw() {  
  background(200);
  
  text(topText, width * 0.50, height * 0.10);
  text(bottomText, width * 0.50, height * 0.84);
  
  // This saves the canvas as an image on the first frame of the program.
  if (frameCount == 1) {
    save("output.png");
  }
}
