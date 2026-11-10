PImage [] squares = new PImage[6];
squares[0] = loadImage("images/green.png");
squares[1] = loadImage("images/orange.png");
squares[2] = loadImage("images/yellow.png");
squares[3] = loadImage("images/blue.png");
squares[4] = loadImage("images/white.png");
squares[5] = loadImage("images/black.png");

int blockWidth = 160;
size(3840, 2080);
background(0);

for(int i = 0; i < width; i += blockWidth){
  for(int j = 0; j < height; j += blockWidth){
    int r = (int)random(squares.length);
    image(squares[r], i, j);
  }
}

save("output.png");
