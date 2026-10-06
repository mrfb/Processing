background(255);
//square(0, 0, 100);

rectMode(CENTER);
noFill();
translate(50, 50);
scale(3);
circle(0, 0, 25);

resetMatrix();
translate(25, 25);
rotate(TAU/8.0);
square(0, 0, 25);

resetMatrix();
translate(75, 25);
rotate(TAU/8.0);
square(0, 0, 25);

resetMatrix();
translate(25, 75);
rotate(TAU/8.0);
square(0, 0, 25);

resetMatrix();
translate(75, 75);
rotate(TAU/8.0);
square(0, 0, 25);

save("diagram.png");
