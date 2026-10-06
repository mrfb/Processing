// Lecture 4 Demonstration
// Making an vintage Advice Animal

// tweaking variables
// advice caiman follows sensible advice...
String topText = "I SLEPT FOR 8 HOURS";
// ...and then suffers bad consequences
String bottomText = "ALL THE WAY\nTHROUGH CLASS";

// declare image + font at the global scope
PImage caiman;
PFont impact;
PVector topTextAnchor, bottomTextAnchor;

color bg1, bg2, bg3, bg4;

void setup(){
  size(1024, 1024);
  noStroke();
  
  // initialize image + font
  caiman = loadImage("caiman.png");
  impact = loadFont("Impact-108.vlw");
}

void draw(){
  topTextAnchor = new PVector(width*0.50, height*0.08);
  bottomTextAnchor = new PVector(width*0.50, height*0.86);
  
  // draw a background made out of colorful triangles
  drawBackground();
  
  // slap an image of an animal on top
  scale(0.76);
  image(caiman, 0, 98);
  resetMatrix();
  
  // draw text at the top and bottom
  textFont(impact);
  textAlign(CENTER,CENTER);
  // draw a black "outline" of text behind our text
  fill(#000000);
  text(topText, topTextAnchor.x-5, topTextAnchor.y-5);
  text(bottomText, bottomTextAnchor.x-5, bottomTextAnchor.y-5);
  text(topText, topTextAnchor.x+5, topTextAnchor.y-5);
  text(bottomText, bottomTextAnchor.x+5, bottomTextAnchor.y-5);
  text(topText, topTextAnchor.x-5, topTextAnchor.y+5);
  text(bottomText, bottomTextAnchor.x-5, bottomTextAnchor.y+5);
  text(topText, topTextAnchor.x+5, topTextAnchor.y+5);
  text(bottomText, bottomTextAnchor.x+5, bottomTextAnchor.y+5);
  // draw the actual text in white
  fill(#ffffff);
  text(topText, topTextAnchor.x, topTextAnchor.y);
  text(bottomText, bottomTextAnchor.x, bottomTextAnchor.y);
  
  // save our horrible crimes
  if(frameCount == 1){
    String filename = "output";
    save(filename + ".png");
    println("saved as " + filename + ".png");
  }
}

void drawBackground(){
  // draw a background made out of colorful triangles
  bg1 = #ff2b40;
  bg2 = #2C65FF;
  bg3 = #5E8B0B;
  bg4 = #f77438;
  
  background(bg1);
  
  translate(width*0.50, height*0.50);
  fill(bg2);
  triangle(0, 0,
           width*-0.50, height*-0.50,
           width*0.00, height*-0.50);
  fill(bg3);
  triangle(0, 0,
           width*0.00, height*-0.50,
           width*0.50, height*-0.50);
  fill(bg4);
  triangle(0, 0,
           width*0.50, height*0.00,
           width*0.50, height*-0.50);
  // rotate halfway around and repeat
  rotate(TAU * 0.50);
  fill(bg2);
  triangle(0, 0,
           width*-0.50, height*-0.50,
           width*0.00, height*-0.50);    
  fill(bg3);
  triangle(0, 0,
           width*0.00, height*-0.50,
           width*0.50, height*-0.50);
  fill(bg4);
  triangle(0, 0,
           width*0.50, height*0.00,
           width*0.50, height*-0.50);
           
  resetMatrix();
}
