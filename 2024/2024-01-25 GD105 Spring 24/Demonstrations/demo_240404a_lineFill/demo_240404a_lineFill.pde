// draw lines between two existing lines

void setup(){
  size(800, 800);
}

void draw(){
  background(255);
  
  hLines(124, 653, 5);
}

void hLines(float start, float end, int num){
  float chunk = (end - start) / float(num + 1);
  
  //endcap display
  stroke(#ff0000, 80);
  line(0, start, width, start);
  line(0, end, width, end);
  stroke(0);
  
  for (float pos = start + chunk; pos < end; pos += chunk){
    line(0, pos, width, pos);
  }
  
}
