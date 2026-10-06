// it's often easiest to declare all your variables up here, outside of setup and draw
float circleSize = 10.0;  // this sets a decimal variable to 10.0
float tween;              // this sets a variable, but we'll set its value later

void setup(){      // setup runs once at the start of the program
  size(666,666);   // set the canvas to this many pixels (wide, tall)
  colorMode(HSB, 1.0);   // changes the way Processing interprets color values
  noStroke();      // turns off the black border around shapes. change color w/ stroke()
}

void draw(){               // code in here gets run every frame
  if(keyPressed == false && circleSize > 0){  // when nothing is being pressed...
    circleSize--;                             // decrease the circle
  }
    
  tween = min(1, circleSize / 100);  // our in-between value ranges from 0 to 1
  
  fill(tween * .1, .5 + tween * .5, .7 + tween * .3);  // ranges from ??? to ???
  ellipse(mouseX, mouseY, circleSize, circleSize);  // draw a circle (x, y, w, h)
}

void keyPressed(){  // this function gets called when a key is pressed
   // if any button is being pressed...
   circleSize++;          // ...and then increase circle size
   
   if(key == 's'){        // if it's "s" specifically...
      save("output.png");    // save an image
   }
   
   if(keyCode == UP){      // certain special keys need a keyCode instead of just key
     println("What's up?");
   }
}
