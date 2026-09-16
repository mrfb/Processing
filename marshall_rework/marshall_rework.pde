// drawing a scope, like, for gameing
size(666, 333);
background(255*1.0);
translate(width/2, height/2); // move origin to center
noStroke(); // turn off the line surrounding shapes

// draw the lens of the sc0p3
fill(255*0.2); // set the shape to 20% grey
ellipse(0, 0, height*.95, height*.95);

fill(255*1.0, 255*0.5);
ellipse(0, 0, height*.85, height*.85);
