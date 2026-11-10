import gohai.simpletweet.*;
SimpleTweet simpletweet;

void tweet(String caption){
  simpletweet = new SimpleTweet(this);
  initializeSimpleTweet();
  
  // get() will just grab whatever the current canvas looks like.
  String tweet = simpletweet.tweetImage(get(), caption);
  println("Posted " + tweet);
}

//TODO: get more screenshots, set up a file format to position them

void setup(){
  size(620, 467);
  
  image(loadImage("peewee_exploitable.png"), 0, 0);
  
  textAlign(CENTER);
  
  String wordOfTheDay = words[int(random(words.length))];
  
  fill(#232425);
  textSize(48);
  translate(310, 385);
  rotate(TAU*-.004);
  text(wordOfTheDay, 0, 0);
  
  save("output.png");
  tweet(wordOfTheDay);
  exit();
}
