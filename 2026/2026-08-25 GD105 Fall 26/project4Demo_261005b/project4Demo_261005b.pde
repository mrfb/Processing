// Matthew R.F. Baloušek
// 2026-10-05
// In-class image-placement demonstration for GD105.

size(1000, 1000);

PImage trent = loadImage("trent.png");
PImage yeah = loadImage("yes.png");

// image(img, x, y, w, h)
float imageScale = 0.65;
image(trent, 9, 9, 
      trent.width * imageScale, trent.height * imageScale);
      
int bubblesDrawn = 0;
while(bubblesDrawn < 5){
  image(yeah, 400 - bubblesDrawn * 100, 400 - bubblesDrawn * 50);
  bubblesDrawn = bubblesDrawn + 1;
}
