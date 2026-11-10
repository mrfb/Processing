import gohai.simpletweet.*;
SimpleTweet simpletweet;
import processing.video.*;
Movie episode;

String caption = "";

//String projectDir = "/Users/plexy/twitterbots/crabstick/";
String projectDir = "/Volumes/mbuck1tb/xfer/crabstick/";

int pull = 30;
boolean useBuffer = (random(1) > .3);
float opBuffer = 62;
float edBuffer = 94;

PrintWriter output;

float rTime = -1;

void setup() {
  size(960, 720);
  output = createWriter("log.txt");
  
  String[] files = loadStrings(projectDir + "files.txt");
  String rFile = files[(int)random(files.length)];
  chronicle("rFile: " + rFile);
  
  caption += rFile;

  episode = new Movie(this, projectDir + rFile + ".mp4");
  episode.loop();
  
  opBuffer *= useBuffer?1:0;
  edBuffer *= useBuffer?1:0;
  
  rTime = random(opBuffer, episode.duration() - edBuffer);
  chronicle("rTime: " + rTime);
}

void draw() {
  
  if (episode.available()) {
    episode.read();
    
    episode.jump(rTime);
    output.flush();

    image(episode, 0, 0);

    if (frameCount >= pull) {
      finishUp();
    }
    
  }
  //image(episode, 0, 0);
}

void finishUp() {
  save("output.png");
  chronicle("saved as output.png");
  chronicle("buffer: " + useBuffer);
  chronicle(caption);
  tweet();
  output.close();
  exit();
}

void tweet() {
  simpletweet = new SimpleTweet(this);
  initializeSimpleTweet();

  // get() will just grab whatever the current canvas looks like.
  String tweet = simpletweet.tweetImage(get(), caption);
  chronicle("Posted " + tweet);
}

void keyPressed(){
  rTime = random(opBuffer, episode.duration() - edBuffer);
  chronicle("rTime: " + rTime);
}

void chronicle(String message){
  println(message);
  output.println(message);
  output.flush();
}
