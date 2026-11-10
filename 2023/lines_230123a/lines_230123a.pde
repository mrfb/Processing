// 20230123 Matthew R.F. Baloušek
// Just a simple program to draw some lines.

// setup runs once when the program begins
// inputs: none
// outputs: none (void)
void setup(){
  size(500, 350);  
  // size(canvas width, canvas height)
  
  print("Hello from setup()!");
  // print(message) <- must be a string, wrapped in ""
}

// draw runs once every frame (~60fps)
// inputs: none
// outputs: none (void)
void draw(){
  background(255);
  // background(0..255) for greyscale colors
  line(100, 100, 250, 250);
  // line(x1, y1, x2, y2)
}
