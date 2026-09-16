void setup(){
  d(20);
  //killSheep(5);
}

int d(int numSides){
  int roll = int(random(numSides)+1);
  println("d"+numSides+":\t"+roll);
  return roll;
}

void killSheep(int numSheep){
  println("SLAUGHTERING " + numSheep + " SHEEP");
  int meat = 0;
  for(int i = 0; i < numSheep; i++){
    int meatGenerated = int(random(3));
    println("sheep " + (i+1) + ":\t\t" + meatGenerated);
    meat += meatGenerated;
  }
  println("====================\nMEAT:\t\t" + meat);
}
