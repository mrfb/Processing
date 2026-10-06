class WanderingImage{
  PVector anchor;
  PImage img;
  float landSpeed;
  PVector heading;
  float size;
  
  // our wandering image puts an image on the canvas and moves it forward a bit at a time
  WanderingImage(String filename, float scale){
    anchor = new PVector(random(width*0.33,  width*0.66), 
                         random(height*0.33, height*0.66));
    img = loadImage(filename);
    landSpeed = 1.0;
    heading = PVector.random2D().mult(landSpeed);
    size = scale;
  }
  
  void wander(){
    // move in the direction we're facing
    anchor.add(heading);
    
    // turn a little
    float noiseScale = 0.001;
    float n = noise(anchor.x * noiseScale,
                    anchor.y * noiseScale);
    heading.rotate(map(n, 0, 1, radians(-1), radians(1)));
    
    //if we're offscreen, turn around
    if(  anchor.x < 0
      || anchor.x > width
      || anchor.y < 0
      || anchor.y > height)
      heading.rotate(TAU * 0.5);
  }
  
  void display(){
    resetMatrix();
    translate(anchor.x, anchor.y);
    scale(size);
    rotate(heading.heading()); // angle of the heading vector
    if(debug){
      strokeWeight(1 / size);
      line(-9999, 0, 9999, 0);
      line(0, -9999, 0, 9999);
    }
    image(img, 0, 0);
  }
  
}
