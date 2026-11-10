interface Command{
  void execute();
}

class Notifier implements Command{
  void execute(){
    println("In the zone!");
  }
}

class Wall implements Command{
  void execute(){
    g.getBall().bounce();
    println("Bounced!");
  }
}

class Goal implements Command{
  Player p_;
  
  void setPlayer(Player p){
    p_ = p;
  }
  
  void execute(){
    // todo: add score to goal
    
    println("Score!");
  }
}
