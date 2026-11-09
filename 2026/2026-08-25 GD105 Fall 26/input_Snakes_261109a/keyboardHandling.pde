void keyTyped(){
  if(key == ' '){
    save("output.png");
    println("saved!");
  }
  
  // erase the canvas
  if(key == 'a' || key == 'A'){
    background(#FFFFFF);
    return;
  }
  
  // this will probably break
  brush = key;
}
