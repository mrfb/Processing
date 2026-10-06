// tuning
int clickSpeed = 60;
int textFade = 55;
int barFade = 350;

// persistent variables
GameState mode = GameState.TITLE;
int lastClick = 0;
int clickCount = 0;

enum GameState {
  TITLE, GAME, GAMEOVER
}

void setup(){
  size(666, 666);
  textAlign(CENTER, CENTER);
  textSize(32);
  noStroke();
}

void draw(){
  String bigText = "";
  String littleText = "";
  int framesSinceLastClick = frameCount - lastClick;
  
  switch(mode){
    case TITLE:
      background(#ffbf00);
      fill(255);
      bigText = "SCREEN CLICKER 5";
      littleText = "Click to start.";
      break;
      
    case GAME:
      background(255);
      if(clickCount < barFade){
        fill(#aa0000);
      } else {
        float fadeProgression = constrain((clickCount - barFade) / 255.0, 0, 1);
        fill(lerpColor(#aa0000, #ffffff, fadeProgression));
      }
      rect(0, 0, width - width * (framesSinceLastClick / float(clickSpeed)), 50);
      
      if(clickCount < textFade){
        fill(0);
      } else {
        fill(constrain(clickCount - textFade, 0, 255));
      }
      bigText = "It's been " + framesSinceLastClick + " frames since your last click.";
      littleText = "Click! You've clicked " + clickCount + " times.";
      if(framesSinceLastClick >= clickSpeed){
        mode = GameState.GAMEOVER;
      }
      break;
      
    case GAMEOVER:
      background(0);
      fill(255);
      bigText = "GAME OVER";
      littleText = "Click to return to title.";
      break;
  }
  
  textSize(32);
  text(bigText, width/2, height/2 - 50);
  textSize(24);
  text(littleText, width/2, height/2 + 50);
}

void mousePressed(){
  lastClick = frameCount;
  clickCount++;
  
  switch(mode){
    case TITLE:
      mode = GameState.GAME;
      break;
      
    case GAME:
      break;
      
    case GAMEOVER:
      mode = GameState.TITLE;
      clickCount = 0;
      break;
  }
}
