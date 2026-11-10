String [] hex = {"A", "B", "C", "D", "E", "F"};
color ink = #FFFFFF;

void setup() {
  size(500, 500);
  background(#FFFFFF);
  fill(#FFFFFF);
}

void draw() {
  //saveFrame("frames/####.png");
}

void mouseClicked(){
  fill(ink);
  noStroke();
  circle(mouseX, mouseY, 30);
}

void mouseDragged(){
  stroke(ink);
  strokeWeight(30);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed(){
  String col = "FF";
  for(int i = 0; i < 6; i++){
    col += hex[int(random(6))];
  }
  ink = color(unhex(col));
  println(col);
  fill(ink);
}
