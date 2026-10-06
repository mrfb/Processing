void mouseDragged() {
  if(!spawnOnDrag) return;
  //flock.addBoid(new Boid(mouseX,mouseY));
  PVector prev = new PVector(pmouseX, pmouseY);
  PVector current = new PVector(mouseX, mouseY);
  spawnLine((int)random(1, 5), prev, current);
}

void mouseClicked() {
  if(!spawnOnClick) return;
  //flock.addBoid(new Boid(mouseX,mouseY));
  spawnPointSpread(new PVector(mouseX, mouseY), (int)random(20, 40));
  //float r = random(100);
  //spawnWreath((int)random(20, 100), new PVector(mouseX, mouseY), r, r);
}

void keyPressed() {
  if(key == ' '){
    init();
  }
  if(!spawnOnPress) return;
  flock.addBoid(new Boid(random(width), random(height)));
  //spawnPointSpread(new PVector(random(width), random(height)), (int)random(20, 40));
}
