import processing.pdf.*;
import gohai.simpletweet.*;

// generally, call startup() somewhere in setup() and saveAndQuit() when finished
// note line 35 which handles the tweet caption when saving to twitter

String filename = "output";
boolean saveToPNG = true;
boolean saveToTwitter = true;
boolean saveToPDF = false;
boolean pauseOnFinish = true;
long seed = 0L; // set to non-zero value to set manual seed

void startup(){
  if(saveToPDF){
    beginRecord(PDF, filename + ".pdf");
  }
  setSeed();
}

void saveAndQuit(){
  println("all done.");
  
  if(saveToPDF){
    endRecord();
    println("saved as " + filename + ".pdf");
  }
  
  if(saveToPNG){
    save(filename + ".png");
    println("saved as " + filename + ".png");
  }
  
  if(saveToTwitter){
    tweetCanvas("" + seed + " (" + String.format("%,d", snailCount) + " snails)");
  }
  
  if(loop){
    println("starting over!");
    init();
  } else {
    println("bye!");
    exit();
  }
}

void tweetCanvas(String tweetText){
  SimpleTweet inksnails = new SimpleTweet(this);
    
  inksnails.setOAuthConsumerKey("b0zjBvsk57jtTteUeF8LaZ0rp");
  inksnails.setOAuthConsumerSecret("wivVDIxrzWtXoGQUojmmOwpMdTMtNlYqHo5lMnnvWV1VmfI3Ik");
  inksnails.setOAuthAccessToken("1059269650754818048-dhET9xQ9e3twpmmBjdYh3u805m3NOq");
  inksnails.setOAuthAccessTokenSecret("MUQYas7TYgKuqm1EhZA4UDbLspA1mZ1S8w7LK9mKfaV96");
  
  println("tweetText: " + tweetText);
  String tweet = inksnails.tweetImage(get(), tweetText);
  println("tweeted: " + tweet);
}

void setSeed(){
  if(seed == 0L){
    seed =  second() * 1L;
    seed += minute() * 100L;
    seed += hour()   * 10000L;
    seed += day()    * 1000000L;
    seed += month()  * 100000000L;
    seed += year()   * 10000000000L;
  }
  
  println("seed: " + seed);
  randomSeed(seed);
}
