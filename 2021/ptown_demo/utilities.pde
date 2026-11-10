import processing.pdf.*;
import gohai.simpletweet.*;

// generally, call startup() somewhere in setup() and saveAndQuit() when finished
// note line 35 which handles the tweet caption when saving to twitter

String filename = "output";
boolean saveToPNG = true;
boolean saveToTwitter = false;
boolean saveToPDF = false; // needs below initialization
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
    tweetCanvas(p.getUsedColors());
  }
  
  println("bye!");
  if(pauseOnFinish){
    noLoop();
  } else {
    exit();
  }
}

void tweetCanvas(String tweetText){
  SimpleTweet palettetowne = new SimpleTweet(this);
    
  palettetowne.setOAuthConsumerKey("mYhSFuU9THQqB7S1a8QfwR0Sr");
  palettetowne.setOAuthConsumerSecret("HBVJMHf5XKFYgNtHK3FwBjDVAJ5zTEZCA5sTGUnROO6vaw0H6f");
  palettetowne.setOAuthAccessToken("1060902201130934273-fEKuwE3kLAk5cb8zJP2Kf7Vw3kOm19");
  palettetowne.setOAuthAccessTokenSecret("T1pZ8TUCwlgPwDFvAg2phKxa2oZu5Z6Qz2otEmAzRlfvS");
  
  println("tweetText: " + tweetText);
  String tweet = palettetowne.tweetImage(get(), tweetText);
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
