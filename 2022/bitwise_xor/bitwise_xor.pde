// change these strings to change which files go in
// and optionally change the output
String inputAName = "IMG_1856.png";
String inputBName = "IMG_1860.png";
String outputName = "output.png";

// we'll need these for later
PImage imgA, imgB, output;
int w, h;

// settings lets us define the size dynamically so we can easily swap out images
void settings(){
  imgA = loadImage(inputAName);
  imgB = loadImage(inputBName);
  println("inputs: " + inputAName + ", " + inputBName);
  
  if(imgB.width != imgB.width || imgA.height != imgB.height){
    println("warning! input images aren't the same size. odd things will happen...");
  }
  
  // some resilience for different-size images
  w = max(imgA.width, imgB.width);
  h = max(imgA.height, imgB.height);
  
  output = createImage(w, h, RGB);
  
  // size should be 3x the width and 1x the height
  size(w * 3, h);
}

void setup(){
  // before we look at the pixels using the pixel array,
  // we gotta load them into memory
  imgA.loadPixels();
  imgB.loadPixels();
  output.loadPixels();
  
  // we're going to check each of the pixels in each image
  color pixelA, pixelB;
  for(int i = 0; i < imgA.pixels.length; i++){
    
    // load the corresponding pixels of our two images
    // the try/catch blocks just let it default to black
    // if the images are different sizes
    try {
      pixelA = imgA.pixels[i];
    } catch(Exception e) {
      pixelA = #000000;
    }
    
    try {
      pixelB = imgB.pixels[i];
    } catch(Exception e) {
      pixelB = #000000;
    }
    
    // what are we doing to the image?
    // in this case, we're doing a bitwise XOR (the ^ operator)
    output.pixels[i] = pixelA ^ pixelB;
  }
  
  // now that we've done stuff to our output's pixel array
  // we need to save it back into the image
  output.updatePixels();
  
  // let's display our inputs/outputs
  image(imgA, 0, 0);
  image(imgB, w, 0);
  image(output, 2 * w, 0);
  
  // print filenames with a hacky drop shadow for readability
  fill(#000000);
  text(inputAName, 10, 20);
  text(inputBName, w + 10, 20);
  text(outputName, 2*w + 10, 20);
  
  fill(#ffffff);
  text(inputAName, 10-1, 20-1);
  text(inputBName, w + 10-1, 20-1);
  text(outputName, 2*w + 10-1, 20-1);
  
  output.save(outputName);
  println("output: " + outputName);
}
