// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
    
    if(!stopOnCollision) return;
    
    // Cull snoids that have hit another line
    loadPixels();
    // run backwards so we can remove and loop through in one go
    for (int i = boids.size() - 1; i >= 0; i--){
      // grab the item from the arraylist
      
      Boid b = boids.get(i);
      if(random(1) < spawnDensity){
        boids.add(new Boid(b.position.x, b.position.y));
      }
      
      
      // I need to walk through the pixels between the current point and the next point
      // to check for collisions on all of them, not just the next one
      
      // we want to check the pixel in front of the snoid so they don't stop themselves
      PVector nxPosition = b.position.copy();
      nxPosition.add(b.velocity.copy().setMag(checkDistance));
      nxPosition.x = int(nxPosition.x % width);
      nxPosition.y = int(nxPosition.y % height);
      int r = constrain(round(nxPosition.y), 0, height-1);
      int c = constrain(round(nxPosition.x), 0, width-1);
      color vCol = pixels[r * width + c];
      
      if(printCheck){
        stroke(#ff0000);
        strokeWeight(1);
        point(c, r);
        stroke(ink);
        strokeWeight(lineWidth);
      }
      
      if(vCol == ink){  // if it's on an ink-colored pixel
        line(b.position.x, b.position.y, b.prPosition.x, b.prPosition.y);
        boids.remove(i);           // remove it from the simulation
        continue;
      }
      
      PVector nextPos = PVector.add(b.position, b.velocity);
      if(!wrap){
        if( nextPos.x < 0 || nextPos.x > width || nextPos.y < 0 || nextPos.y > height){
          line(b.position.x, b.position.y, b.prPosition.x, b.prPosition.y);
          boids.remove(i);
          continue;
        }
      }
      
      r = constrain(round(nextPos.y), 0, height-1);
      c = constrain(round(nextPos.x), 0, width-1);
      vCol = resist.pixels[r * width + c];
      if(random(1) < alpha(vCol)){
        boids.remove(i);
        continue;
      }
    }
  }

  void addBoid(Boid b) {
    int r = constrain(round(b.position.y), 0, height-1);
    int c = constrain(round(b.position.x), 0, width-1);
    color vCol = resist.pixels[r * width + c];
    if(random(1) > alpha(vCol)){
      boids.add(b);
    }
  }

}
