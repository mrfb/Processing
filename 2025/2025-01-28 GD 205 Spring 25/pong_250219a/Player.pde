class Player{
  // FIELDS
  private Zone goal_;
  private Zone paddle_;
  private int hitPoints = 15;
  private char upKey, downKey, leftKey, rightKey;
  private boolean upPressed, downPressed, leftPressed, rightPressed;
  
  // CONSTRUCTORS
  Player(Zone paddle, Zone goal, color fill){
    goal_ = goal;
    paddle_ = paddle;
    goal_.setColor(fill);
    paddle_.setColor(fill);
  }
  
  // METHODS
  void update(){
    if(upPressed){
      paddle_.move(0, -1);
    }
    if(leftPressed){
      paddle_.move(-1, 0);
    }
    if(downPressed){
      paddle_.move(0, 1);
    }
    if(rightPressed){
      paddle_.move(1, 0);
    }
    
    goal_.update();
    paddle_.update();
  }
  
  void display(){
    goal_.setOpacity(hitPoints);
    goal_.display();
    paddle_.display();
  }
  
  void press(char c){
    if (c == upKey){
      upPressed = true;
    } else if (c == leftKey){
      leftPressed = true;
    } else if (c == downKey){
      downPressed = true;
    } else if (c == rightKey){
      rightPressed = true;
    }
  }
  
  void release(char c){
    if (c == upKey){
      upPressed = false;
    } else if (c == leftKey){
      leftPressed = false;
    } else if (c == downKey){
      downPressed = false;
    } else if (c == rightKey){
      rightPressed = false;
    }
  }
  
  // "WASD" maps as expected
  void setControls(String keys){
    upKey = keys.charAt(0);
    leftKey = keys.charAt(1);
    downKey = keys.charAt(2);
    rightKey = keys.charAt(3);
  }
}
