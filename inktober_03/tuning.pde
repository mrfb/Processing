// META
String filename = "output.png";
long seed = (long)(random(1) * 9223372036854775807L);
//long seed = 6518745506095562752L

// SPAWNING
int circleBoids = 120;
float circleMin = 201;
float circleMax = 512;
int centerBoids = 0;
int noiseBoids  = 0;
int lineBoids   = 0;
float wreathSize = 200;
boolean drip = true;
int dripDelay = 99999999;
int hangTime = 120;  // time to wait at the end to allow for input
boolean spawnOnClick = true;   // at mouse location
boolean spawnOnDrag = true;   // at mouse location
boolean spawnOnPress = true;   // random location
float spawnDensity = 0.2; // clones with this likelihood per frame

// RENDERING
float lineWidth = 4;
boolean printCheck = false;
int killFrame = 0;

// BEHAVIOR
boolean wrap = false; // wrap around edges or fall off
boolean stopOnCollision = true;
float checkDistance = lineWidth * 0.8 ;  // how far ahead the snoids check for collisions

// BOIDS
float lineSpeed = 5.0;  // base 1.5
float lineDexterity = 0.06;  // base 0.03

// FLOCKING
float neighbordist = 10000;   // how far boids will look around them
float desiredseparation = 50.0f; // separation they try to maintain
boolean fixedSep = true;
boolean fixedCoh = true;
boolean fixedAli = true;
float cSeparation = 1.5;
float cCohesion = 1.0;
float cAlignment = 15.0;
float rSeparation = random(50.5, 100.5);
float rCohesion = random(0.1, 0.5);
float rAlignment = random(0.1, 0.5);
