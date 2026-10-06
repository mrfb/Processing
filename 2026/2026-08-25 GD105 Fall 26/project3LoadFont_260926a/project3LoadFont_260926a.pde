size(1000, 1000);
background(255);
fill(0);

// show anchor
stroke(0, 128);
line(0, height/2, width, height/2);
line(width/2, 0, width/2, height);

String message = "hey guys";

// set font and style
PFont copperplate = loadFont("Copperplate-Bold-80.vlw");
textFont(copperplate);
//textSize(80);
fill(#aa0000);

translate(width*.5, height*.5);
textAlign(CENTER, CENTER);
rotate(TAU * 1/16);
text(message, 0, 0);
