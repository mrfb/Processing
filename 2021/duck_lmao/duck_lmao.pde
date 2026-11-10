String topText = "Have you heard the one about the duck?";
String bottomText = "It's a real quacker.";
String input = "duck_lmao.jpg";
String output = "The Funniest Danged Meme Perhaps Ever.png";

PImage duck;
PFont times;

void setup() {
  // Load an image that doesn't have text...
  size(640,427);  // set the size of the canvas to the exact size of the image we're about to load
  duck = loadImage(input);  // load duck
  image(duck, 0, 0, width, height);  // PUT THAT DUCK ON THE SCREEN
  
  // ...write text on the image in appropriate places using the `text()` method and non-default settings...
  textSize(50);            // make it 50 pixels tall
  times = createFont("Times New Roman.ttf", 50); // load TNR, which is in the sketch folder
  textFont(times);         // set the font to TNR
  text("quack", 475, 150); // make the duck quack
  
  textSize(20);            // change the text size settings again
  text("quack", 505, 170); // a smaller quack
  
  int margin = 30;
  stroke(255);
  strokeWeight(5);
  textAlign(CENTER);
  fill(252, 207, 3); // set the text color the a yellowish
  text(topText, width/2, margin);
  
  textSize(40);
  text(bottomText, width/2, height-margin);
  
  // ...and save the resulting output as an image.
  save(output);
  println("File saved as: " + output);
}
