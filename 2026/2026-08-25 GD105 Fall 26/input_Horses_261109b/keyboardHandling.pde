void keyPressed(){
  if(key == 'q'){
    circleSize = 50;
  }
  
  if(key == ' '){
    save("output.png");
    println("saved!");
  }
}
