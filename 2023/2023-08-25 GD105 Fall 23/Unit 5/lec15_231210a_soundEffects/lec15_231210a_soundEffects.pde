// bgm and sfx via freesound.org
import processing.sound.*;
SoundFile laser;

// an Amplitude object lets us monitor the volume of something
Amplitude amp;


void setup(){
  laser = new SoundFile(this, "39459__the_bizniss__laser.wav");
  amp = new Amplitude(this);
  amp.input(laser);
  
  noFill();
}

void draw(){
  background(255);
  
  //check the volume of the laser and draw a circle based on how loud it is
  stroke(#ff0000, 128);
  
  circle(width/2, height/2, max(amp.analyze() * width, 1));
}

void keyPressed(){
  // this will play the sound if it isn't already playing
  if(!laser.isPlaying()){
    laser.play();
    println("zap! (frame " + frameCount + ")");
  }
  
  // alternate method: this restarts the sound when
  // the key is pressed, so keymashing still
  // doesn't have overlapping sound
    
  //laser.jump(0);
}
