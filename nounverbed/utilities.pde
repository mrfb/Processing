import processing.pdf.*;
import gohai.simpletweet.*;

// generally, call startup() somewhere in setup() and saveAndQuit() when finished
// note line 35 which handles the tweet caption when saving to twitter

String filename = "output";
boolean saveToPNG = true;
boolean saveToTwitter = true;
boolean pauseOnFinish = false;
long seed = 0L; // set to non-zero value to set manual seed

void startup(){
  setSeed();
}

void saveAndQuit(){
  println("all done.");
  
  if(saveToPNG){
    save(filename + ".png");
    println("saved as " + filename + ".png");
  }
  
  if(saveToTwitter){
    tweetCanvas(message.toUpperCase());
  }
  
  println("bye!");
  if(pauseOnFinish){
    noLoop();
  } else {
    exit();
  }
}

void tweetCanvas(String tweetText){
  SimpleTweet nounverbed = new SimpleTweet(this);
    
  nounverbed.setOAuthConsumerKey("kO4t60oMMuv1yERQFk7TZnXyR");
  nounverbed.setOAuthConsumerSecret("62b4wVinaRiHCDwEtgTNss5KvTwG0ooQZ7XK9WIo1fKPjHKVvQ");
  nounverbed.setOAuthAccessToken("1134268992573575175-9KKM7iJB63ukmcGltS0wxrPPo2ltkv");
  nounverbed.setOAuthAccessTokenSecret("jNdnhRP5Wt5Pkyel2kXkwqJswnrJhIMcUjwjk4DYnUQK0");
  
  println("tweetText: " + tweetText);
  String tweet = nounverbed.tweetImage(get(), tweetText);
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
