import processing.serial.*; //import the Serial library
Serial myPort;  //the Serial port object
String val;

// since we're doing serial handshaking, 
// we need to check if we've heard from the microcontroller
boolean firstContact = false;


void setup() {
  size(200, 200); //make our canvas 200 x 200 pixels big
  //  initialize your serial port and set the baud rate to 9600
  myPort = new Serial(this, Serial.list()[4], 9600);
  myPort.bufferUntil('\n'); 
}

void draw()
{
  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.readStringUntil('\n');         // read it and store it in val
  } 
  println(val); //print it out in the console
}