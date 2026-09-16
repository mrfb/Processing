// META
String filename = "output.png";
String resistImage = ""; // blank to skip loading
boolean additive = false;
long seed = (long)(random(1) * 9223372036854775807L);
//long seed = 6518745506095562752L

// SPAWNING
int circleBoids = 0;
float circleMin = 400;
float circleMax = 400;
int squareBoids = 5;
boolean evenGrid = true;
boolean oddGrid = true;
int centerBoids = 0;
int cornerBoids = 0;
int midpointBoids = 0;
int noiseBoids  = 0;
int lineBoids   = 0;
boolean leafBoid = false;
boolean drip = false;
int dripDelay = 100;
int hangTime = 100;  // time to wait at the end to allow for input
boolean spawnOnClick = true;   // at mouse location
boolean spawnOnDrag = true;   // at mouse location
boolean spawnOnPress = true;   // random location
float spawnDensity = .02; // clones with this likelihood per frame
int generationCap = 30;

// BOIDS
float lineSpeed = 1.0;  // base 1.5
float lineDexterity = 0.03;  // base 0.03

// FLOCKING
float neighbordist = 180;   // how far boids will look around them
float desiredseparation = 30.0f; // separation they try to maintain
boolean fixedSep = true;
boolean fixedCoh = true;
boolean fixedAli = true;
float cSeparation = 0.5;
float cCohesion = 0.3;
float cAlignment = 1.8;
float rSeparation = random(0, 3.0);
float rCohesion = random(0, 3.0);
float rAlignment = random(0, 3.0);

// RENDERING
float lineWidth = 4;
boolean printCheck = false;
int killFrame = 0;
boolean showResist = false;

// BEHAVIOR
boolean wrap = false; // wrap around edges or fall off
boolean stopOnCollision = true;  // things often break when this is false
float checkDistance = lineWidth * 0.8 ;  // how far ahead the snoids check for collisions
