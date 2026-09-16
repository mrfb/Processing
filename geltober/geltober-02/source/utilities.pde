import processing.pdf.*;
import gohai.simpletweet.*;

// generally, call startup() somewhere in setup() and saveAndQuit() when finished
// note line 35 which handles the tweet caption when saving to twitter

String filename = "output";
boolean saveToPNG = true;
boolean saveToPDF = false;
boolean saveToTwitter = true;
boolean pauseOnFinish = false;
long seed = 0L; // set to non-zero value to set manual seed

void startup(){
  if(saveToPDF){
    beginRecord(PDF, filename + ".pdf");
  }
  setSeed();
}

void saveAndQuit(){
  println("all done.");
  
  if(saveToPNG){
    save(filename + ".png");
    println("saved as " + filename + ".png");
  }
  
  if(saveToTwitter){
    tweetCanvas(mode+"."+seed);
  }
  
  if(saveToPDF){
    endRecord();
  }
  
  println("bye!");
  if(pauseOnFinish){
    noLoop();
  } else {
    exit();
  }
}

void tweetCanvas(String tweetText){
  SimpleTweet inktober2019 = new SimpleTweet(this);
    
  inktober2019.setOAuthConsumerKey("cOpRnDiIa0Sz17LyJrGLITyLj");
  inktober2019.setOAuthConsumerSecret("iOrajZBeQRxIfqRvjXXx8ZF1wHmHBz7rFW48a1N6c4IEPJfv8G");
  inktober2019.setOAuthAccessToken("1179155689853333504-G7y6Zm0xFvVTJSVKccngp2BtjLorHg");
  inktober2019.setOAuthAccessTokenSecret("6DyPeapfQXaepgyzaTrIzUcwnYmjlUoeKoHOPPrEjbAh3");
  
  println("tweetText: " + tweetText);
  String tweet = inktober2019.tweetImage(get(), tweetText);
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
  noiseSeed(seed);
}
