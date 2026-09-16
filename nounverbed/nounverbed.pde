String message = ""; // put stuff in here to override random picking
int rnoun, rverb;
import java.io.*;
File f;
String[] nouns, verbeds;

PImage bg;

String projectdir = "/Users/plexy/Google Drive/Games and Projects/Bots/nounverbed/";

void settings(){
  // load up a random file from the directory of 900w screenshots
  String images = projectdir + "images 900/";
  
  f = new File(images);
  String[] list = f.list();
  bg = loadImage(images + list[(int)random(list.length)]);
  //bg = loadImage("blank900.png");
  // set the canvas size to those dimensions
  
  size(bg.width, bg.height);
  
  // load up the word lists
  nouns = loadStrings(projectdir + "words/nouns.txt");
  verbeds = loadStrings(projectdir + "words/verbeds.txt");
}

void setup(){
  background(0);
  startup();
  image(bg, 0, 0);
  
  float bannerTop = height * 0.43;
  float bannerHeight = height * 0.20;
  float bannerBottom = bannerTop + bannerHeight;
  
  PGraphics banner = createGraphics(width, height);
  banner.beginDraw();
  banner.rectMode(CORNERS);
  banner.fill(0, 0, 0, 255 * .70);
  banner.noStroke();
  banner.rect(width * 0.0, bannerTop, width * 1.0, bannerBottom);
  banner.filter(BLUR, 12);
  banner.endDraw();
  image(banner, 0, 0);
  
  if(message == ""){
    rnoun = (int)random(nouns.length);
    String noun = nouns[rnoun];
    
    rverb = (int)random(verbeds.length);
    String verbed = verbeds[rverb];
    
    message = noun + " " + verbed;
  }
  
  PGraphics wordDraw = createGraphics((int)(width*1.4), height);
  wordDraw.beginDraw();
  //PFont font = loadFont("OptimusPrincepsSemiBold-48.vlw");
  PFont font = createFont("Deutch Garamond SSi.ttf", height*.13);
  wordDraw.fill(200, 0, 0, 255 * .7);
  wordDraw.textFont(font);
  wordDraw.textAlign(CENTER, CENTER);
  wordDraw.text(message.toUpperCase(), wordDraw.width*.5, bannerTop + bannerHeight*.46);
  wordDraw.endDraw();
  image(wordDraw, 0, 0, width, height);
  
  println(message.toUpperCase());
  
  saveAndQuit();
}
