void mouseDragged() {
  if(spawnOnDrag) flock.addBoid(new Boid(mouseX,mouseY));
}

void mouseClicked() {
  if(spawnOnClick) flock.addBoid(new Boid(mouseX,mouseY));
}

void keyPressed() {
  if(spawnOnPress) flock.addBoid(new Boid(random(width), random(height)));
}
