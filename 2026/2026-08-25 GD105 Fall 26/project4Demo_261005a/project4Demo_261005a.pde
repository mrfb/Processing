// Matthew R.F. Baloušek
// 2026-10-05
// In-class image-placement demonstration for GD105.

size(1000,1000);

PImage kitty = loadImage("IMG_7887.png");

float resizeScale = 0.25;

int catsDrawn = 0;
while(catsDrawn < 5){
  image(kitty, 700 - catsDrawn * 200, 200 + catsDrawn * 100,
        kitty.width * resizeScale, kitty.height * resizeScale);
  catsDrawn = catsDrawn + 1; // prevents infinite loop
}

// alternate image resize method below

//stroke(#ff0000);
//strokeWeight(20);
//line(0, 1000, 9999, 1000);
//line(500, 0, 500, 9999);

//scale(0.25);

//strokeWeight(20);
//stroke(#0000ff);
//line(0, 1000, 9999, 1000);
//line(500, 0, 500, 9999);

//image(kitty, 500, 1000);

//resetMatrix();
