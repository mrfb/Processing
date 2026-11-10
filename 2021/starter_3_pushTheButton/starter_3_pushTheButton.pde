float mouseXPrevious = mouseX;
float mouseYPrevious = mouseY;
String mode;

void setup(){
  // Code that runs once at the start of
  // the program goes in this block.
  background(255);
  mode = "default";
  println("mode set to " + mode); 
}

void draw(){
  // Code that runs every frame of the
  // program goes in this block.
  
  // We're keeping track of this frame's
  // coordinates for next frame.
  mouseXPrevious = mouseX;
  mouseYPrevious = mouseY;
}

void mouseDragged(){
  // Code that runs when the mouse is
  // pressed down and moving goes here.
  if(mode == "default"){
    line(mouseX, mouseY, mouseXPrevious, mouseYPrevious);
  }
  
}

void keyPressed(){
  // Code that runs when ANY key is pressed
  // goes in this code block.

  if(key == '1'){
    mode = "default";
  } else if (key == '2'){
    mode = "two";
  } else {
    println("Don't know what to do with input: " + key);
    return;
  }

  println(key + " -> mode is " + mode);
}
