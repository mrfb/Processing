// META
long seed = (long)(random(1) * 9223372036854775807L);
//long seed = 4676062973989486592L;
String filename = "" + seed + ".png";
String resistImage = ""; // blank to skip loading
boolean additive = false;

// FLOCK BASIC SETTINGS
float lineSpeed = 8.5;  // base 1.5
float lineDexterity = 0.03;  // base 0.03
float separation = 1.0;
float cohesion = 1.0;
float alignment = 1.0;

// FLOCK ADVANCED SETTINGS
float neighbordist = 70;   // how far boids will look around them
float desiredseparation = 50.0f; // separation they try to maintain
boolean noiseForces = false; // multiplies forces by local noise

// RENDERING
float lineWidth = 4;
boolean printCheck = false;
int killFrame = 0;
boolean showResist = false;

// BEHAVIOR
boolean wrap = false; // wrap around edges or fall off
boolean stopOnCollision = true;  // things often break when this is false
float checkDistance = lineWidth * 0.8 ;  // how far ahead the snoids check for collisions

void flockSettings(float a, float c, float s, float ls, float ld){
  alignment = a;
  cohesion = c;
  separation = s;
  lineSpeed = ls;
  lineDexterity = ld;
}

void flockSettingsRandom(){
  alignment = random(0, 2);
  cohesion = random(0, 2);
  separation = random(0, 2);
  lineSpeed = random(0, 2);
  lineDexterity = random(.1);
}

void flockSettingsDefault(){
  alignment = 1.0;
  cohesion = 1.0;
  separation = 1.5;
  lineSpeed = 1.5;
  lineDexterity = 0.03;
}
