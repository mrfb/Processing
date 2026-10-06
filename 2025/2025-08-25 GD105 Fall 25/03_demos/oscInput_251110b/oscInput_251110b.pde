boolean wHeld, sHeld, aHeld, dHeld, eHeld;

import processing.sound.*;

SawOsc w;
TriOsc a;
SqrOsc s;
SinOsc d;
Pulse e;


void setup(){
  size(800, 800);
  textSize(32);
  
  w = new SawOsc(this);
  w.amp(0.3);
  w.freq(500);
  
  a = new TriOsc(this);
  a.amp(0.7);
  a.freq(500);
  
  s = new SqrOsc(this);
  s.amp(0.3);
  s.freq(500);
  
  d = new SinOsc(this);
  d.amp(0.5);
  d.freq(500);
  
  e = new Pulse(this);
  e.amp(0.5);
  e.freq(500);
  
}

void draw(){
  background(255);
  
  // range of human hearing is 20hz to 20 khz
  float freq = map(mouseY, height, 0, 20, 2000);
  float amp = map(mouseX, 0, width, 0, 1);
  if(sin(frameCount * 0.60) < 0){
    amp = 0;
  }
  
  textAlign(CENTER, CENTER);
  
  color keyColor = #aa0000;
  PVector location = new PVector(width * 0.50, height * 0.25);
  if(wHeld){
    fill(keyColor, 255);
    w.set(freq, amp, 0);
    w.play();
  } else {
    fill(keyColor, 50);
    w.stop();
  }
  circle(location.x, location.y, 100); 
  fill(255);
  text("saw", location.x, location.y);
  
  keyColor = #0000aa;
  location.set(width * 0.25, height * 0.50);
  if(aHeld){
    fill(keyColor, 255);
    a.set(freq, amp, 0);
    a.play();
  } else {
    fill(keyColor, 50);
    a.stop();
  }
  circle(location.x, location.y, 100); 
  fill(255);
  text("tri", location.x, location.y);
  
  keyColor = #00aa00;
  location.set(width * 0.50, height * 0.50);
  if(sHeld){
    fill(keyColor, 255);
    s.set(freq, amp, 0);
    s.play();
  } else {
    fill(keyColor, 50);
    s.stop();
  }
  circle(location.x, location.y, 100); 
  fill(255);
  text("sqr", location.x, location.y);
  
  keyColor = #aaaa00;
  location.set(width * 0.75, height * 0.50);
  if(dHeld){
    fill(keyColor, 255);
    d.set(freq, amp, 0);
    d.play();
  } else {
    fill(keyColor, 50);
    d.stop();
  }
  circle(location.x, location.y, 100); 
  fill(255);
  text("sin", location.x, location.y);
  
  keyColor = #aa00aa;
  location.set(width * 0.75, height * 0.25);
  if(eHeld){
    fill(keyColor, 255);
    e.set(freq, 0.5, amp, 0, 0);
    e.play();
  } else {
    fill(keyColor, 50);
    e.stop();
  }
  circle(location.x, location.y, 100); 
  fill(255);
  text("pls", location.x, location.y);
  
  // display
  line(0, mouseY, width, mouseY);
  fill(0);
  textAlign(LEFT, CENTER);
  text("freq: " + freq, mouseX + 30, mouseY - 30);
  line(mouseX, 0, mouseX, height);
  text("amp: " + amp, mouseX + 30, mouseY + 30);
}

void keyPressed(){
  switch(key){
    case 'w':
    case 'W':
      wHeld = true;
      break;
    case 'a':
    case 'A':
      aHeld = true;
      break;
    case 's':
    case 'S':
      sHeld = true;
      break;
    case 'd':
    case 'D':
      dHeld = true;
      break;
    case 'e':
    case 'E':
      eHeld = true;
      break;
  }
}

void keyReleased(){
  switch(key){
    case 'w':
    case 'W':
      wHeld = false;
      break;
    case 'a':
    case 'A':
      aHeld = false;
      break;
    case 's':
    case 'S':
      sHeld = false;
      break;
    case 'd':
    case 'D':
      dHeld = false;
      break;
    case 'e':
    case 'E':
      eHeld = false;
      break;
  }
}
