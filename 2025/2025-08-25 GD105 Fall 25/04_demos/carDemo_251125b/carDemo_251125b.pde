Car dreamMachine;
PImage streets;

void setup(){
  size(894, 894);
  dreamMachine = new Car(width/2, height/2);
  rectMode(CENTER);
  streets = loadImage("meanStreets.jpg");
  background(0);
}

void draw(){
  image(streets, 0, 0);
  
  if(keyPressed){
    switch(key){
      case 'w':
        dreamMachine.accelerate();
        break;
      case 's':
        dreamMachine.brake();
        break; // lol
      case 'a':
        dreamMachine.turn(-5); // slight left turn
        break;
      case 'd':
        dreamMachine.turn(5); // slight right
        break;
     }
  }
  
  
  dreamMachine.display();
  dreamMachine.update();
}
