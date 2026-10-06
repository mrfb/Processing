// META
String filename = "output.png";
long seed = (long)(random(1) * 9223372036854775807L);
//long seed = 6518745506095562752L

// SPAWNING
int circleBoids = 0;
float circleMin = 0;
float circleMax = 512;
int centerBoids = 40;
int noiseBoids  = 0;
int lineBoids   = 0;
boolean drip = false;
int dripDelay = 100;
int hangTime = 150;  // time to wait at the end to allow for input
boolean spawnOnClick = true;   // at mouse location
boolean spawnOnDrag = true;   // at mouse location
boolean spawnOnPress = true;   // random location
float spawnDensity = 0.03; // clones with this likelihood per frame

// RENDERING
float lineWidth = 4;
boolean printCheck = false;
int killFrame = 250;
boolean showResist = false;
String resistImage = "resist squeeze.png"; // blank to skip loading

// BEHAVIOR
boolean wrap = false; // wrap around edges or fall off
boolean stopOnCollision = true;
float checkDistance = lineWidth * 0.8 ;  // how far ahead the snoids check for collisions

// BOIDS
float lineSpeed = 1.5;  // base 1.5
float lineDexterity = 0.03;  // base 0.03

// FLOCKING
float neighbordist = 100;   // how far boids will look around them
float desiredseparation = 150.0f; // separation they try to maintain
boolean fixedSep = true;
boolean fixedCoh = true;
boolean fixedAli = true;
float cSeparation = 4.0;
float cCohesion = 1.0;
float cAlignment = 1.0;
float rSeparation = random(0, 2.0);
float rCohesion = random(0, 2.0);
float rAlignment = random(0, 2.0);
