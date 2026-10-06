// declaring our PImage variables
PImage backdrop;
PImage myFriendUltraman;
PImage villain;

void setup(){
  size(1024, 680); // exact size of southBronx.jpg
  
  // loading our images into memory
  backdrop = loadImage("southBronx.jpg");
  myFriendUltraman = loadImage("ultramanAffinity.png");
  villain = loadImage("bemular.png"); 
}

void draw(){
  // works just like background, but we're passing an image instead of a color
  background(backdrop);
  
  // declaring a scale variable to lock aspect ratio
  float scale = 0.35;
  // arguments 4 and 5 adjust size of the image
  // we can ask the computer to check the size for us
  image(myFriendUltraman, 74, 10, myFriendUltraman.width * scale, myFriendUltraman.height * scale);
  
  // we can use transforms also, but they can be a little clunky
  scale(0.49);
  rotate(0.16);
  image(villain, 611, -53);
  resetMatrix();
  
  // it needed to be said
  rotate(0.27);
  text("get rekt", 291, 20);
  
  // save the image on the first frame
  if(frameCount == 0){
    save("output.png");
  }
}
