class Car {
  PVector location, velocity, acceleration;
  int heading;
  color paintJob;
  
  // this is our constructor -- it initializes stuff
  Car(int x, int y){
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    heading = 0;
    
    paintJob = #aa0000;
  }
  
  void accelerate(){
    if(velocity.mag() < 0.01){
      velocity = PVector.fromAngle(radians(heading));
    } else {
      velocity.setMag(velocity.mag() + .1);
      velocity.limit(5);
    }
  }
  
  void brake(){
    velocity.mult(0.9);
  }
  
  void turn(int amount){
    heading += amount;
    velocity.rotate(radians(amount));
  }
  
  void update(){
    location.add(velocity);
  }
  
  void display(){
    resetMatrix();
    translate(location.x, location.y);
    rotate(radians(heading));
    
    rectMode(CENTER);
    noStroke();
    fill(paintJob);
    rect(0, 0, 50, 20);
    fill(255);
    circle(20, -6, 5);
    circle(20, 6, 5);
    fill(#aa0000);
    circle(-20, -5, 4);
    circle(-20, 5, 4);
  }
}
