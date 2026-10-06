PImage img1, img2, img3, img4, img5;

void setup(){
  size(666, 666);
  img1 = loadImage("IMG_4051.png");
  img2 = loadImage("IMG_4249.png");
  img2.resize(int(img2.width*0.18), int(img2.height*0.18));
  img3 = loadImage("IMG_4270.png"); // masked
  img4 = loadImage("IMG_4283.png");
  img5 = loadImage("IMG_4284.png");
}

void draw(){
  background(#ff00ff);
  image(img5, 0, -138, width, height); // cheating slightly
  image(img2, -250, 151);
  purrImage(img4, 234, -46, 0.20, 3, 3);
  purrImage(img3, -50, 225, 0.20, 2, 2);
  purrImage(img1, 323, 250, 0.18, 1, 1);
  
  //if(frameCount == 1) {
  //  save("ravioliCollage.png");
  //}
}

// purrImage draws an image at a particular place with an x/y random jitter
void purrImage(PImage i, float x, float y, float scale, float xJitter, float yJitter){
  image(i,
        x+random(-xJitter, xJitter),
        y+random(-yJitter, yJitter),
        i.width*scale, i.height*scale);
}
