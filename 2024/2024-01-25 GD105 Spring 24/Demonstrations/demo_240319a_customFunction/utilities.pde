// This places an image at (x,y) with a particular rotation and scale
void plopImage(PImage img, float x, float y, float theta, float scale){
  translate(x, y);
  rotate(theta);
  //scale(scale) is equivalent
  image(img, 0, 0, img.width * scale, img.height * scale);
  resetMatrix();
}
