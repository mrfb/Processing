void setMode(){
  String[] permittedModes = {"grid-1", "grid-2", "kinetic", "perspective"};
  
  int rMode = int(random(permittedModes.length));
  rMode = int(random(permittedModes.length));
  mode = permittedModes[rMode];
  
  // for production
  //mode = "repeat";
  
  println("mode: " + mode);
  
  switch(mode){
    case "grid-1":
      grid1();
      break;
    case "grid-2":
      grid2();
      break;
    case "kinetic":
      kinetic();
      break;
    case "perspective":
      perspec();
      break;
    case "repeat":
      repeat();
    default:
      // this shouldn't happen
      exit();
      break;
  }
}

void repeat(){
  
}

void perspec(){
  // timed drops for shapes overlapping
  // heterogeneous shapes/scales
  dTau = random(15); // flag for heterogenous dTau per particle
  noiseScale = random(20)/width;
  
  collideKill = true;
  heterogeneous = true;
  strokeCap(PROJECT);
  
  drip = 20;
}

void drop(){
  float dir = random(TAU);
  //dTau = random(.5, 5);
  PVector p = new PVector(random(width*.1, width*.9), random(height*.1, height*.9));
  particles.add(new Particle(p.x, p.y, dir));
  particles.add(new Particle(p.x, p.y, dir+TAU*.5));
}

void kinetic(){
  dTau = 20;
  noiseScale = 0.8/width;
  noiseKill = false;
  collideKill = true;
  strokeCap(PROJECT);
  
  int collisions = (int)random(2,69);
  for(int i = 0; i < collisions; i++){
    PVector p = new PVector(random(width), random(height));
    int spokes = int(random(2,9));
    for(int j = 0; j < spokes; j++){
      particles.add(new Particle(p.x, p.y, TAU*random(1) ));
    }
  }
}

void grid2(){
  noiseScale = random(0.001, 0.01);
  println("noiseScale: " + noiseScale);
  dTau = random(0.05, 0.25);
  println("dTau: " + dTau);
  
  int intersections = int(random(5, width/25));
  println("intersections: " + intersections);
  for(int i = 0; i < intersections; i++){
    //PVector p = new PVector(random(width*.1, width*.9), random(height*.1, height*.9));
    PVector p;
    if(i%2 == 0){
      p = new PVector(width*(i+1)/(intersections+2.0), height*.09);
      particles.add(new Particle(p.x, p.y, TAU*.00));
      particles.add(new Particle(p.x, p.y, TAU*.50));
      
      p = new PVector(width*.09, height*(i+1)/(intersections+2.0));
      particles.add(new Particle(p.x, p.y, TAU*.25));
      particles.add(new Particle(p.x, p.y, TAU*.75));
    } else {
      p = new PVector(width*(i+1)/(intersections+2.0), height*.91);
      particles.add(new Particle(p.x, p.y, TAU*.00));
      particles.add(new Particle(p.x, p.y, TAU*.50));
      
      p = new PVector(width*.91, height*(i+1)/(intersections+2.0));
      particles.add(new Particle(p.x, p.y, TAU*.25));
      particles.add(new Particle(p.x, p.y, TAU*.75));
    }
  }
}

void grid1(){
  // get corners
  PVector ul, ur, bl, br;
  
  switch((int)random(3)){
    case 0: // keep to respective corners
      ul = new PVector(random(width*.15, width*.50), random(height*.15,height*.50));
      ur = new PVector(random(width*.50, width*.85), random(height*.15,height*.50));
      bl = new PVector(random(width*.15, width*.50), random(height*.50,height*.85));
      br = new PVector(random(width*.50, width*.85), random(height*.50,height*.85));
      break;
    case 1: // anywhere goes
      ul = new PVector(random(width*.15, width*.85), random(height*.15,height*.85));
      ur = new PVector(random(width*.15, width*.85), random(height*.15,height*.85));
      bl = new PVector(random(width*.15, width*.85), random(height*.15,height*.85));
      br = new PVector(random(width*.15, width*.85), random(height*.15,height*.85));
      break;
    default: // use box
      ul = new PVector(width*.10, height*.10);
      ur = new PVector(width*.90, height*.10);
      bl = new PVector(width*.10, height*.90);
      br = new PVector(width*.90, height*.90);
      break;
  }
  
  point(ul.x, ul.y);
  point(ur.x, ur.y);
  point(bl.x, bl.y);
  point(br.x, br.y);
  
  // draw box around corners
  stroke(p.getColor(-1));
  line(ul.x, ul.y, ur.x, ur.y);
  stroke(p.getColor(-1));
  line(ur.x, ur.y, br.x, br.y);
  stroke(p.getColor(-1));
  line(br.x, br.y, bl.x, bl.y);
  stroke(p.getColor(-1));
  line(bl.x, bl.y, ul.x, ul.y);
  
  // draw ten points on each line
  int segments = (int)random(1,20);
  float[] top = new float[segments];
  float[] bottom = new float[segments];
  float[] left = new float[segments];
  float[] right = new float[segments];
  
  for(int i = 0; i < segments; i++){
    top[i] = random(1);
    bottom[i] = random(1);
    left[i] = random(1);
    right[i] = random(1);
  }
  
  top = sort(top);
  bottom = sort(bottom);
  left = sort(left);
  right = sort(right);
  
  for(int i = 0; i < segments; i++){
    // draw a top-bottom line
    PVector t = new PVector(lerp(ul.x, ur.x, top[i]), lerp(ul.y, ur.y, top[i]));
    PVector b = new PVector(lerp(bl.x, br.x, bottom[i]), lerp(bl.y, br.y, bottom[i]));
    stroke(p.getColor(-1));
    line(t.x, t.y, b.x, b.y);
    
    // draw a left-right lines
    PVector l = new PVector(lerp(ul.x, bl.x, left[i]), lerp(ul.y, bl.y, left[i]));
    PVector r = new PVector(lerp(ur.x, br.x, right[i]), lerp(ur.y, br.y, right[i]));
    stroke(p.getColor(-1));
    line(l.x, l.y, r.x, r.y);
    
  }
  
  done = true;
}
