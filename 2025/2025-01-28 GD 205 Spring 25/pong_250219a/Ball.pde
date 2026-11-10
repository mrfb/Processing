class Ball{
  // FIELDS
  private PVector position_;
  private PVector velocity_;
  private PVector acceleration_;
  private float radius_ = 10;
  private color fill_;
  private float speed_ = 3;
  
  // observers might go here...?
  
  // CONSTRUCTOR
  Ball(PVector serveDirection){
    position_ = new PVector(width/2, height/2);
    velocity_ = new PVector(serveDirection.x, serveDirection.y).normalize().mult(speed_);
    acceleration_ = new PVector(0, 0);
  }
  
  // random direction constructor
  Ball(){
    position_ = new PVector(width/2, height/2);
    velocity_ = PVector.random2D();
    acceleration_ = new PVector(0, 0);
  }
  
  // METHODS
  void update(){
    position_.add(velocity_);
    velocity_.add(acceleration_);
    
    // assume we always want to wall in the screen
    position_.x = constrain(position_.x, 9, width-9);
    position_.y = constrain(position_.y, 9, height-9);
    
    // maybe constrain speed here
  }
  
  void display(){
    fill(fill_);
    noStroke();
    square(position_.x - radius_, position_.y - radius_, radius_*2);
  }
  
  void bounce(){
    // this is a bad physics calculation
    // TODO: make this not bad
    velocity_.x *= -1;
    velocity_.rotate(radians(random(-20, 20)));
    //position_.add(velocity_);
  }
  
  void setColor(color c){
    fill_ = c;
  }
  
  PVector getPosition(){
    return position_;
  }
}
