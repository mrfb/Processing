class Zone{
  // FIELDS
  private PVector position_;
  private PVector size_;
  private color fill_ = #ff00ff;
  private color stroke_ = #ff00ff;
  private Command collisionBehavior_;
  
  // CONSTRUCTORS
  Zone(float x, float y, float w, float h, String zoneType){
    position_ = new PVector(x, y);
    size_ = new PVector(w, h);
    switch(zoneType){
      case "WALL":  
        collisionBehavior_ = new Wall();
        break;
      case "GOAL":
        collisionBehavior_ = new Goal();
        break;
      default:
        collisionBehavior_ = new Notifier();
        break;
    }
    
  }
  
  // METHODS
  void update(){
    if(isColliding(g.getBall().getPosition())){
      collisionBehavior_.execute();
    }
  }
  
  void display(){
    fill(fill_);
    stroke(stroke_);
    rect(position_.x, position_.y, size_.x, size_.y);
  }
  
  boolean isColliding(PVector p){
    boolean xCollide, yCollide;
    xCollide = (p.x > position_.x) && (p.x < position_.x + size_.x);
    yCollide = (p.y > position_.y) && (p.y < position_.y + size_.y);
    
    return xCollide && yCollide;
  }
  
  void move(float x, float y){
    position_.add(x, y);
  }
  
  void setColor(color c){
    fill_ = c;
    stroke_ = c;
  }
  
  void setOpacity(int n){
    // keeps outline visible at full opacity
    fill_ = color(red(fill_), green(fill_), blue(fill_), (n / 15.0) * 255);
  }
}
