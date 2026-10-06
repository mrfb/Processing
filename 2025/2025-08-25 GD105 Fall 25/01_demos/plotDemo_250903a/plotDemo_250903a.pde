import processing.svg.*;

size(288, 288); // 3" x 3"
beginRecord(SVG, "myCoolPlot.svg");

// This is more formatting and whitespace than
// we might normally use. Also, the stuff after
// the "//" at the start of the line indicates
// that this is a comment for humans to read,
// not code for the computer to run.

line(0, 0,
     width, height);
     
line(0, height,
     width, 0);
     
line(width/2, height/2,
     width/2, height);
     
endRecord();
