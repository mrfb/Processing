Game g;

void setup(){
  size(800, 600);
  g = new Game();
}

void draw(){
  g.update();
  g.display();
}

void keyPressed(){
  for(Player p : g.players){
    p.press(key);
  }
}

void keyReleased(){
  for(Player p : g.players){
    p.release(key);
  }
}

// CLASSES
// design patterns...? command, observer

// ball (potentially multiple?): position, radius, fill

// zones: position, size, fill, stroke
  // wall
    // paddle
  // goal
  
// player: control mappings, paddle, fill, name
