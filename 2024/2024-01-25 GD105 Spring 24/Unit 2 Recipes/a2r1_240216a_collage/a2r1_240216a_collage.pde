// declaring your PImage variables

void setup(){
  // set the canvas size
  
  // loading your images into memory
}

void draw(){
  // draw your background
  
  // for each image, use the image function to apply it to the canvas
  // you may want to adjust the size of it using
  // transforms or the image() function
  
  // save the image on the first frame
  if(frameCount == 0){
    save("output.png");
  }
}
