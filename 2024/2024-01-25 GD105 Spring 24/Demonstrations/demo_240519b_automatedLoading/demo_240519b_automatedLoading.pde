// demo for earthan
// kinetic collage using the most recent music friday collage pieces

WanderingImage[] wanderers;
boolean debug = false;

// the File class is our file input/output manager from the java class
// https://docs.oracle.com/javase/8/docs/api/java/io/File.html
File f;

void setup(){
  size(1024, 1024);
  noSmooth();
  
  // this is the important part:
  // dataPath("") gets us the platform-specific absolute
  // location of where the data folder is
  f = new File(dataPath(""));
  println("files in the data directory:");
  for(int i = 0; i < f.list().length; i++){
    println(i+1 + ":\t" + f.list()[i]);
  }
  
  // allocate one object per image in the data directory
  wanderers = new WanderingImage[f.list().length];
  
  // now initialize the images
  for(int i = 0; i < f.list().length; i++){
    wanderers[i] = new WanderingImage(f.list()[i], 0.15);
  }
  
}

void draw(){
  background(255);
  for(int i = 0; i < wanderers.length; i++){
    wanderers[i].wander();
    wanderers[i].display();
  }
}
