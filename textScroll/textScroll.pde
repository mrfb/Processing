// these get used globally, but shouldn't be altered
Stanza[] stanzas = new Stanza[14];
int currentStanza = 0;
float ceiling = -1;
PVector inputCursor = new PVector(0,0);
int cursorOffset;
boolean finished = false;

// these values can be tweaked and changed
float margin = 50;
float stanzaSpace = 100;
float fontSize = 24;
float scrollSpeed = 5.0;
int blinkSpeed = (int)frameRate * 4; // speed of cursor blink in frames
int cursorWidth = 15;
int cursorHeight = 22;

void setup(){
 size(666,666);
 rectMode(CENTER);
 textFont(loadFont("Monospaced-24.vlw"), fontSize);  // located in the data directory of this sketch
 textLeading(fontSize);
 
 defineStanzas();
 arrangeStanzas();
 
}

void draw(){
  background(255);
  
  // run through the array of stanzas and draw their corresponding text
  fill(0);
  for(int i = 0; i < stanzas.length; i++){
    if(stanzas[i].leftAligned){
      textAlign(LEFT);
    } else {
      textAlign(RIGHT);
    }
    String textToPrint = stanzas[i].text.substring(0, stanzas[i].revealed);
    text(textToPrint, stanzas[i].x, stanzas[i].y);
  }
  
  if(stanzas[currentStanza].leftAligned){
    reveal(); // reveal one character each frame
    cursorOffset = 0; // reset the cursor offset
  } else {
    blink(); // blink to indicate input is being accepted, and reveal() on input
  }
  
}

// full text of stanzas is written in here. \n is a linebreak
void defineStanzas(){
  stanzas[0] = new Stanza("XXXX\nXXXX\nXXXX\nfirst\nstanza", true);
  stanzas[1] = new Stanza("this is the second stanza\nit has\nthree lines", false);
  stanzas[2] = new Stanza("this is the third stanza it is really really really really really really long", true);
  
  // temporary filler
  for(int i = 3; i < stanzas.length; i++){
    boolean alignment = i % 2 == 0; // alternates true/false
    stanzas[i] = new Stanza("this is the " + (i + 1) + "th stanza", alignment);
  }
}

// spaces out all the stanzas based on the number of lines in the preceding stanzas
void arrangeStanzas(){
  stanzas[0].y = margin;
  for(int i = 1; i < stanzas.length; i++){
    stanzas[i].y = stanzas[i-1].y + stanzas[i-1].numLines * fontSize + stanzaSpace;
  }
}

// inverts a section of the screen to simulate a cursor input
void blink(){
  // if the poem is finished, don't blink--you don't want to miss this
  if(finished){
    return;
  }
  
  // if we're in the first half of the blink cycle, do nothing
  if(frameCount % blinkSpeed < blinkSpeed / 2){
    return;
  }
  
  // if we're in the second half of the blink cycle, invert a chunk of screen
  
  // first update the cursor's position
  inputCursor.set(stanzas[currentStanza].x - cursorWidth + 1, stanzas[currentStanza].y - cursorHeight + cursorOffset + 1);
  
  // then grab the corresponding section of the screen, invert it, and draw it on the screen
  PImage chunk = get((int)inputCursor.x, (int)inputCursor.y, cursorWidth, cursorHeight);
  chunk.filter(INVERT);
  image(chunk, inputCursor.x, inputCursor.y);
}

// increment the number of revealed characters for the current stanza
void reveal(){
  if(finished) return;
  
  // Check to see if we should increment currentStanza
  boolean isFullyRevealed = stanzas[currentStanza].revealed >= stanzas[currentStanza].text.length();
  if( isFullyRevealed ){
    /// ...move on to the next one
    currentStanza++;
    return;
  }
  
  // if we're over the number of stanzas there are, we're done and don't need to do anything
  if (currentStanza >= stanzas.length){
    finished = true;
    currentStanza = stanzas.length - 1; // just to make sure we don't overflow the integer
    return;
  }
  
  // reveal some of its characters
  stanzas[currentStanza].revealed++;
  
  // if we revealed a newline, move the cursor down a bit
  char revealedCharacter = stanzas[currentStanza].text.charAt(stanzas[currentStanza].revealed - 1);
  if(revealedCharacter == '\n'){
    cursorOffset += fontSize;
  }
}

void keyTyped(){
  reveal();
  // play sound?
}

// this gets called whenever the mouse is scrolled
void mouseWheel(MouseEvent event){
  // the scroll direction might be inverted on certain systems
  float e  = event.getCount() * scrollSpeed;
  //println(e);
  
  // don't let the screen pan up past the ceiling
  if(ceiling + e > 0){
    println("bonked on the ceiling");
    return;
  }
  // don't let the screen pan down past the cursor
  if(inputCursor.y + e - margin < 0) {
    println("bonked on the floor");
    return;
  }
  
  // add the mouse scroll amount to the stanzas, cursor, etc.
  for(int i = 0; i < stanzas.length; i++){
    stanzas[i].y += e;
  }
  inputCursor.y += e;
  ceiling += e;
}