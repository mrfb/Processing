background(255);
noFill();

translate(25, 25);
circle(0, 0, 25);

resetMatrix();
translate(50, 50);
scale(2);
rotate(-TAU*.25);
triangle(cos(TAU*0.00)*25/2,  // p1.x
          sin(TAU*0.00)*25/2,  // p1.y
          cos(TAU*0.33)*25/2,  // p2.x
          sin(TAU*0.33)*25/2,  // p2.y
          cos(TAU*0.66)*25/2,  // p3.x
          sin(TAU*0.66)*25/2); // p3.y

resetMatrix();
translate(75, 25);
circle(0, 0, 25);

resetMatrix();
translate(50, 75);
rotate(TAU*0.5);
arc(0, 0, 25, 25, TAU*0.5, TAU*1.0);

save("output.png");
