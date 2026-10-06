/*
  Assignment 2, Prompt 4
  The Perfect Loop Piece
  
  Make a program that generates the frames for a GIF.
  
  This one will be tricky.
  
  I've given you a little scaffolding code below to help.
  
  Full description: https://mbalousek.notion.site/A2-Variables-Motion-d2a7831243014c8fb79a9f33cf30e2bc?pvs=4
*/

// declare your global variable(s) at the top, outside of any block
float progress;
int frameEnd = 50; // change this to adjust the length of the animation

void setup(){
  
}

void draw(){
  // update progress each frame
  // this is a variable that goes from
  // 0.0 to 1.0 that's useful for animating
  progress = float(frameCount) / float(frameEnd);
  
  // in general, draw stuff on your canvas that uses
  // the progress variable as part of it's calculations
  // things are at their start point at 0, and their end point at 1
 
  
  if(frameCount <= frameEnd){
    saveFrame("frames/####.png");
    println("rendering: " + frameCount + "/" + frameEnd + " (" + progress * 100 + "% done)");
  }
}
