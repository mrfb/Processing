PImage image1, image2, image3, composite;

// This is what's known as a Harris shutter effect,
// or a tricolor separation. (https://en.wikipedia.org/wiki/Harris_shutter)
// We take the red data from one photo, the green from a second,
// and the blue from a third, and combine them to get something 
// where non-moving objects retain their color, while moving things
// gain a kind of chromatic shimmer.

// This will require all three photos to be of the same dimensions!
// It will output a full-size version and a 1000-px version.

void setup() {
  image1 = loadImage("images/IMG_9197.JPG");
  image2 = loadImage("images/IMG_9198.JPG");
  image3 = loadImage("images/IMG_9199.JPG");
  if(image1.width != image2.width || image1.width != image3.width){
    println("Error! These images need to be the same dimensions.");
    exit();
  }
  
  size(1000, 1000);

  // creates an empty image of the correct proportions
  composite = createImage(image1.width, image1.height, RGB);

  // To work with the pixel array(s), first we need to load them.
  // Each image has it's own pixel array, if we're not specifying otherwise,
  // then processing assumes we mean the canvas' pixel array.
  composite.loadPixels();
  image1.loadPixels();
  image2.loadPixels();
  image3.loadPixels();
  
  // Then we do stuff with the pixel array.
  for (int i = 0; i < composite.pixels.length; i++) {
    float red = red(image1.pixels[i]);
    float green = green(image2.pixels[i]);
    float blue = blue(image3.pixels[i]);
    composite.pixels[i] = color(red, green, blue);
  }
  
  // Since we made changes, we need to update the pixel array.
  composite.updatePixels();
  
  // save the full-size image
  composite.save("output_" + composite.width + "px.png");
  
  // make a downsized version for display and save that
  image(composite, 0, 0, width, height);
  save("output_" + width + "px.png");
}
