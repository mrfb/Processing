// This controls the overall state of the sequencer.
int step = 0;
// "final" is a safeguard we can set to make sure we don't accidentally change this
final int stepLimit = 16;

// load up the sound library
import processing.sound.*;
SoundFile square, saw, clack;

// These track whether or not each step is firing
boolean[] moogSquare; // ch0
boolean[] moogSaw; // ch1
boolean[] clackDrum; // ch2

void setup() {
  frameRate(8);
  size(800, 800);
  rectMode(CENTER);

  // allocate arrays - all values are initialized to false by default
  moogSquare = new boolean[stepLimit];
  moogSaw = new boolean[stepLimit];
  clackDrum = new boolean[stepLimit];

  // further initialize with a dummy pattern
  for (int i = 0; i < stepLimit; i++) {
    if (random(1) < 0.25) { // odd steps
      moogSquare[i] = true;
    }
    if (random(1) < 0.125) {
      moogSaw[i] = true;
    }
  }

  // initialize our SoundFiles
  square = new SoundFile(this, "sfx/299896__modularsamples__moog-minitaur-simple-short-square-a2-simple-short-square-46-127.aiff");
  saw = new SoundFile(this, "sfx/278016__modularsamples__moog-minitaur-simple-saw-d3-simple-saw-50-127.aiff");
  clack = new SoundFile(this, "sfx/9363__tvfs__rimshots/151428__tvfs__15b.wav");
}

void draw() {
  background(255);
  
  // highlight current step
  fill(0);
  rect(25 + 50 * step, height/2, 50, height);

  drawChannel(moogSquare, 0, #aa0000);
  drawChannel(moogSaw, 1, #00aa00);
  drawChannel(clackDrum, 2, #0000aa);

  if (moogSquare[step]) {
    square.play();
  }

  if (moogSaw[step]) {
    saw.play();
  }

  if (clackDrum[step]) {
    clack.play();
  }

  step++;
  step %= stepLimit; // you probably don't know what this is and should probably ask
  if (step == 0) {
    mutate();
  }
}

void mutate() {
  int rChannel = int(random(3));
  int rStep = int(random(stepLimit));
  // hard coded: easy place to introduce errors!
  switch (rChannel) {
    case 0:
      moogSquare[rStep] = !moogSquare[rStep];
      break;
    case 1:
      moogSaw[rStep] = !moogSaw[rStep];
      break;
    case 2:
      clackDrum[rStep] = !clackDrum[rStep];
      break;
  }
}

void drawChannel(boolean[] sequence, int channel, color c) {
  for (int i = 0; i < stepLimit; i++) {
    if (sequence[i]) {
      fill(c);
    } else {
      fill(255);
    }
    circle(25 + 50 * i, 25 + 50 * channel, 45);
  }
}
