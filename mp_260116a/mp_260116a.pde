size(1056, 816);
import processing.svg.*;

int margin = int(96 * 0.5); // 48
int gridSize = int(96 * 0.75); // 24

boolean grid = false;
boolean text = false;
boolean circles = false;
boolean chaos = false;
boolean arcs = true;

beginRecord(SVG, "arcsUpper.svg");
for(int y = margin; y <= height - margin; y += gridSize){
  for(int x = margin; x <= width - margin; x += gridSize){
    if(grid){
      point(x, y);
    }
    
    if(text){
      textAlign(BOTTOM, LEFT);
      textSize(14);
      fill(0);
      text("1 MP", x - 14, y + 5);
    }
    
    if(circles){
      noFill();
      circle(x, y, gridSize-16);
    }
    
    if(arcs){
      noFill();
      arc(x, y, gridSize-16, gridSize-16, TAU*0.625, TAU*0.875);
    }
    
    if(chaos){
      float r1 = random((gridSize-8)/2);
      float r2 = random((gridSize-8)/2);
      float theta1 = random(TAU);
      float theta2 = random(TAU);
      line(r1*cos(theta1) + x, r1*sin(theta1) + y, r2*cos(theta2) + x, r2*sin(theta2)+y);
    }
  }
}
endRecord();
