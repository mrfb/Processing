// david found that this is actually relatively simple to do with the tint() function

// this is a more complicated demonstration--please ask in person if you
// are trying to understand this one and want some explanation

// Adding variable transparency to something that already has transparency
// alpha is the same as opacity is the same as transparency

PImage ghost;
PImage ghostMask;
PImage phasingGhost;
PImage spookyTown;

void setup(){
  size(800, 800);
  ghost = loadImage("ghost.png");
  ghostMask = createImage(ghost.width, ghost.height, RGB);
  phasingGhost = ghost.copy();
  
  spookyTown = loadImage("spookyTown.jpg");
}

void draw(){
  // we need to load up all the pixel arrays for our two sources and our one destination
  // then multiply the static / dynamic opacity and set that as the mask of the new image
  // we need to do this every frame or we'll get some weird threshold effects
  ghostMask.loadPixels();
  phasingGhost.loadPixels();
  ghost.loadPixels();
  for(int i = 0; i < ghostMask.pixels.length; i++){
    float varAlpha = map(cos(frameCount * 0.05), -1, 1, 0, 1); // oscillating transparency
    float staticAlpha = map(alpha(ghost.pixels[i]), 0, 255, 0, 1);
    float newAlpha = map(varAlpha * staticAlpha, 0, 1, 0, 255);
    ghostMask.pixels[i] = color(newAlpha);
  }
  ghostMask.updatePixels();
  
  phasingGhost = ghost.copy();
  phasingGhost.mask(ghostMask);
  
  image(spookyTown, 0, 0, spookyTown.width * 0.8, spookyTown.height * 0.8);
  
  scale(0.60);
  image(phasingGhost, 150, 150);
}
