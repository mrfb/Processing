void keyPressed(){
  mutate();
}

void mouseClicked() {
  // translate mouse coords to channel/step
  int channel = floor(mouseY/50);
  int step = floor(mouseX/50);

  // there's a smarter, but more complicated way to do this...
  switch(channel) {
  case 0:
    moogSquare[step] = !moogSquare[step];
    break;
  case 1:
    moogSaw[step] = !moogSaw[step];
    break;
  case 2:
    clackDrum[step] = !clackDrum[step];
    break;
  }
}
