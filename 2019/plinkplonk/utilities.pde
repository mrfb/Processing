import processing.pdf.*;
import gohai.simpletweet.*;

// generally, call startup() somewhere in setup() and saveAndQuit() when finished
// note line 35 which handles the tweet caption when saving to twitter

String filename = "output";
boolean saveToPNG = true;
boolean saveToTwitter = true;
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
    tweetCanvas(message);
  }
  
  println("bye!");
  exit();
}

void tweetCanvas(String tweetText){
  SimpleTweet plinkplonk = new SimpleTweet(this);
    
  plinkplonk.setOAuthConsumerKey("BG6KAPgpF376OFilnjSID80zA");
  plinkplonk.setOAuthConsumerSecret("9mONrWIeUDVVDXFclKpXAgXGgiC4xrYTnI4qFVEFAddf6Y1WKF");
  plinkplonk.setOAuthAccessToken("1134286987349975040-uftzGrhN3A7kz8CiqX172FZQM5AFaK");
  plinkplonk.setOAuthAccessTokenSecret("CCKDwrbvcANmgCmIyh8nDW9DhHe0wqfhhEDPTeYcCI0zF");
  
  println("tweetText: " + tweetText);
  String tweet = plinkplonk.tweetImage(get(), tweetText);
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
