Ball b;
Player[] players = new Player[2];
int unit = 20;

void setup(){
  size(666, 666);
  noStroke();
  
  b = new Ball(width/2, height/2, unit);
  players[0] = new Player(unit * 3, width/2 - unit * 5, 'w', 's');
  players[1] = new Player(width - unit * 4, width/2 + unit * 5, 'i', 'k');
}
  
void draw(){
  background(0);
  // draw the center line
  b.display();
  b.update();
  
  players[0].display();
  players[0].update();
  
  players[1].display();
  players[1].update();
  
  // check for win state
}


boolean pointInsideRect(PVector point, PVector rect, int w, int h){
    return point.x > rect.x && point.x < rect.x + w
           && point.y > rect.y && point.y < rect.y + h;
}
  
class Ball{
  PVector position;
  PVector velocity;
  int size;
  
  Ball(float x, float y, int s){
    position = new PVector(x, y);
    velocity = new PVector(5, random(-5, 5));
    size = s;
  }
  
  void display(){
    square(position.x, position.y, size);
  }
  
  void update(){
    // do physics and add velocity
    position.add(velocity);
    
    // check for collisions
    if(position.y < 0 || position.y + size > height){
      wallBounce();
    }
    
    if(position.x + size < 0){
      score(0);
    } else if (position.x > width) {
      score(1);
    }
    
    for(int i = 0; i < players.length; i++){
      // check each of the corners of the ball for a collision
      if(pointInsideRect(this.position,
                         players[i].position, players[i].xSize, players[i].ySize)){
        paddleBounce();
        break;
      }
      PVector bottomRightCorner = this.position.copy().add(size, size);
      if(pointInsideRect(bottomRightCorner,
                         players[i].position, players[i].xSize, players[i].ySize)){
        paddleBounce();
        break;
      }
      PVector bottomLeftCorner = this.position.copy().add(0, size);
      if(pointInsideRect(bottomLeftCorner,
                         players[i].position, players[i].xSize, players[i].ySize)){
        paddleBounce();
        break;
      }
      PVector topRightCorner = this.position.copy().add(size, 0);
      if(pointInsideRect(topRightCorner,
                         players[i].position, players[i].xSize, players[i].ySize)){
        paddleBounce();
        break;
      }
      
    }
  }
  
  void wallBounce(){
    velocity.y *= -1;
    // *= is a compound assignment operator
  }
  
  void paddleBounce(){
    // fixed x-vel, variable y-vel
    velocity.x *= -1;
  }
  
  void score(int playerNum){
    println("the ball went into player " + playerNum + "'s goal");
    players[playerNum].score++;
    position.set(width/2, random(size * 2, height - size * 3));
  }
}

class Player{
  int score;
  PVector scorePosition;
  PVector position;
  float speed;
  int xSize;
  int ySize;
  char upKey;
  char downKey;
  boolean up;
  boolean down;
  
  Player(float x, float scoreX, char upBinding, char downBinding){
    position = new PVector(x, height/2);
    scorePosition = new PVector(scoreX, 100);
    upKey = upBinding;
    downKey = downBinding;
    xSize = unit;
    ySize = unit * 4;
    speed = 5;
  }
  
  void display(){
    rect(position.x, position.y, xSize, ySize);
    text(score, scorePosition.x, scorePosition.y);
  }
  
  void update(){
    if(up){
      position.y -= speed;
    }
    
    if(down){
      position.y += speed;
    }
    
    position.y = constrain(position.y, 0, height-ySize);
  }
}

void keyPressed(){
  for(int i = 0; i < players.length; i++){
    if(key == players[i].upKey){
      players[i].up = true;
    }
    if (key == players[i].downKey) {
      players[i].down = true;
    }
  }
}

void keyReleased(){
  for(int i = 0; i < players.length; i++){
    if(key == players[i].upKey){
      players[i].up = false;
    }
    if (key == players[i].downKey) {
      players[i].down = false;
    }
  }
}
