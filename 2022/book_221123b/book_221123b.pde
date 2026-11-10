// the plan:
// draw some text on the screen
// i want it to have a "trail" that will cycle
// through colors (for GIF purposes)
// and also let's bounce it up and down
// maybe blingee-style sparkles if i'm feeling feisty
// ready let's go

// tuning variables
boolean saveFrames = true;

// global variables (non-tuning
PFont georgia;
float progress = 0;
float progressStep = 0.01;

void setup() {
  size(1024, 1024);
  frameRate(50); // optimum framerate for gifs on the web

  colorMode(HSB, 1.0); // hue/sat/brightness

  // load the font from the file in the sketch folder...
  georgia = createFont("Georgia Bold Italic.ttf", 128);
  // ...and then apply it
  textFont(georgia);
  textAlign(LEFT, CENTER);

  println(String.join("\n", PFont.list()));
}

void draw() {
  background(0.54, 0.45, 0.93);
  String message = "my\nknees\nhurt";
  textLeading(111);
  PVector anchor = new PVector(128, 512 + sin(progress * TAU) * 128);
  PVector offset = new PVector();

  // this adds offset to anchor and saves the result

  int numTrails = 140;
  float separationY = -0.53;
  for (int i = numTrails; i > 0; i--) {
    float position = i / float(numTrails);
    offset.x = i * 2.4;
    offset.y = sin((progress + position * separationY) * TAU) * -201;

    if (i == 1) {
      // solid background to draw text on top to make it pop
      fill(#ff00f0);
      text(message, anchor.x + offset.x, anchor.y + offset.y);
    }


    fill((position + progress) % 1, 0.22, 1.00, 0.6);
    text(message, anchor.x + offset.x, anchor.y + offset.y);
  }

  progress += progressStep;
  if (progress < 1 && saveFrames) {
    saveFrame("frames/####.png");
  }

  if (progress > 1) {
    println(frameCount + ": looped");
    saveFrames = false;
    progress %= 1;
  }
}
