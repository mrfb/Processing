color rInk;
float showLine;

void drawResist() {
  resist.beginDraw();
  resist.clear();
  rInk = color(0,1,1, random(1) < .5 ? 1.0 : random(.5, 1) );
  resist.fill(rInk);
  resist.ellipseMode(CENTER);
  resist.rectMode(CORNERS);
  resist.stroke(rInk);
  resist.strokeWeight(20);

  switch((int)random(3)){
    case 0:
      showLine = 0;
      break;
    case 1:
      showLine = 1;
      break;
    default:
      showLine = random(1);
      break;
  }

  if (resistImage != "") {
    println("loading resist: " + resistImage);
    resist.image(loadImage(resistImage), 0, 0);
  } else {
    resist.clear();
  }

  //frame();  // for card prints

  do {
    randomResist();
  } while (random(1) < .5);

  resist.endDraw();

  if (resistImage == "") {
    resist.save("resist.png");
  }
}

void randomResist() {
  if(someSmallGames){
    fiveByFive();
    return;
  }
  switch ((int)random(12)) {
  case 0:
  case 1:
    // no resist
    break;
  case 2:
    diamondGrid();
    break;
  case 3:
  case 4:
    circle(random(width*.01, width*.99));
    break;
  case 5:
  case 6:
    square(random(width*.01, width*.99));
    break;
  default:
    frame();
    break;
  }
}

void circle(float r) {
  switch((int)random(4)) {
  case 0:
    // just the border/frame
    //println("circle border");
    resist.noFill();
    resist.ellipse(width/2, height/2, r, r);
    resist.fill(rInk);
    if(random(1) < showLine){
      ellipse(width/2, height/2, r, r);
    }
    break;
  case 1:
    // the outside;
    if (r < width*.2) r = width*.2;
    //println("circle outside");
    resist.noFill();
    if(random(1) < showLine){
      ellipse(width/2, height/2, r, r);
    }
    for (; r < 1.5 * width; r += 10) {
      resist.ellipse(width/2, height/2, r, r);
    }
    resist.fill(rInk);
    break;
  default:
    // just the interior
    //println("circle interior");
    resist.noStroke();
    resist.ellipse(width/2, height/2, r, r);
    resist.stroke(rInk);
    if(random(1) < showLine){
      ellipse(width/2, height/2, r, r);
    }
    break;
  }
}

void square(float d) {
  float r = d * .5;
  resist.translate(width/2, height/2);
  translate(width/2, height/2);
  if (random(1) < 0.5){
    resist.rotate(TAU*.125);
    rotate(TAU*.125);
  } else if (random(1) < .1){
    float theta = random(TAU);
    resist.rotate(theta);
    rotate(theta);
  }
  
  switch((int)random(4)) {
  case 0:
    // just the border/frame
    //println("square border");
    resist.noFill();
    resist.stroke(rInk);
    resist.rect(-r, -r, r, r);
    resist.fill(rInk);
    if(random(1) < showLine){
      rect(-r, -r, r, r);
    }
    break;
  case 1:
    // the outside;
    if (r < width*.1) r = width*.1;
    //println("square outside");
    resist.stroke(rInk);
    resist.noFill();
    if(random(1) < showLine){
      rect(-r, -r, r, r);
    }
    for (; r < width; r += 10) {
      resist.rect(-r, -r, r, r);
    }
    resist.fill(rInk);
    break;
  default:
    // just the interior
    //println("square interior");
    if (r > width*.4) r = width*.4;
    resist.noStroke();
    resist.fill(rInk);
    resist.rect(-r, -r, r, r);
    resist.stroke(rInk);
    if(random(1) < showLine){
      rect(-r, -r, r, r);
    }
    break;
  }
  
  resist.resetMatrix();
  resetMatrix();
}

void diamondGrid() {
  //println("diamondGrid");
  int divisions = (int)random(3, 16);
  float increment = 1.0 / divisions*1.0;

  boolean horizontal = random(1) < .5;
  boolean vertical = horizontal ? random(1) < .5 : true;

  if(vertical){
    for (int i = 0; i <= divisions; i++) {
      resist.line(i * (width*increment), 0, i * (width*increment), height);
      if(random(1) < showLine){
        //line(i * (width*increment), 0, i * (width*increment), height);
      }
    }
  }

  if(horizontal){
    for (int i = 0; i <= divisions; i++) {
      resist.line(0, i * (height*increment), width, i * (height*increment));
      if(random(1) < showLine){
        //line(0, i * (height*increment), width, i * (height*increment));
      }
    }
  }
}

void cards() {
  // assume a 8.5 x 11 ratio
  // use threebythree as a basis
}

void threeByThree() {
  //println("threeByThree");
  resist.noStroke();
  float r = .101; // give a little wiggle room
  
  boolean horizontal = random(1) < .5;
  boolean vertical = horizontal ? random(1) < .5 : true;
  
  if(vertical){
    resist.rect(width*(0.00+0), 0, width*(0.25-r), height);
    resist.rect(width*(0.25+r), 0, width*(0.50-r), height);
    resist.rect(width*(0.50+r), 0, width*(0.75-r), height);
    resist.rect(width*(0.75+r), 0, width*(1.00-0), height);
  }
  
  if(horizontal){
    resist.rect(0, height*(0.00+0), width, height*(0.25-r));
    resist.rect(0, height*(0.25+r), width, height*(0.50-r));
    resist.rect(0, height*(0.50+r), width, height*(0.75-r));
    resist.rect(0, height*(0.75+r), width, height*(1.00-0));
  }
  
  resist.stroke(rInk);
}

void frame() {
  // boxes are 20% of w, centered at the 25%, 50%, and 75% junctions
  //println("frame");
  float r = .01;
  resist.rect(0, 0, width*r, height);
  resist.rect(0, 0, width, height*r);
  resist.rect(width*(1-r), 0, width, height);
  resist.rect(0, height*(1-r), width, height);
}

// for printing 8.5x5.5
void halfPageFrame() {
  //textAlign(CENTER);
  //textSize(24);
  //resist.textSize(24);
  //resist.textAlign(CENTER);
  //println("frame");
  float error = 5;  // to account for ragged boundaries
  float marginShort = 100 + error;
  float marginLong = 100 + error;
  resist.rect(0, 0, marginLong, height);  // left edge
  resist.rect(0, 0, width, marginShort);  //top edge
  resist.rect(width-marginLong, 0, width, height);  // right edge
  resist.rect(0, height-marginShort, width, height); // bottom edge
  
  //resist.text(seed, width/2, 100);
  //fill(ink);
  //text(seed, width/2, 100);
  //noFill();
}

void fiveByFive() {
  int divisions = 5;
  float increment = 1.0 / divisions*1.0;

  resist.strokeWeight(50);
  rInk = color(0,1,1);

  boolean horizontal = true;
  boolean vertical = true;

  if(vertical){
    for (int i = 0; i <= divisions; i++) {
      resist.line(i * (width*increment), 0, i * (width*increment), height);
      if(random(1) < showLine){
        //line(i * (width*increment), 0, i * (width*increment), height);
      }
    }
  }

  if(horizontal){
    for (int i = 0; i <= divisions; i++) {
      resist.line(0, i * (height*increment), width, i * (height*increment));
      if(random(1) < showLine){
        //line(0, i * (height*increment), width, i * (height*increment));
      }
    }
  }
}
