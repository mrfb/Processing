/* Pointilism II
   As Pointilism, but none of the dots can be the same size.
   (It should be a different arrangement, as well.)
   */

size(666, 400);
background(255);

// Draw the solar system!

// Start with the sun at the far left.
strokeWeight(865);
point(-325, height * .5);

// Draw the inner planets.
strokeWeight(3); // Mercury
point(120, height * .5);

strokeWeight(30); // Venus
point(160, height * .5);

strokeWeight(35); // Earth
point(210, height * .5);

strokeWeight(10); // Luna
point(230, height * .5 - 20);

strokeWeight(25); // Mars
point(270, height * .5);

// Draw an asteroid belt
strokeWeight(5);
point(333, height * .5 - 50);

strokeWeight(6);
point(330, height * .5 - 25);

strokeWeight(8);
point(340, height * .5); // center asteroid

strokeWeight(7);
point(325, height * .5 + 25);

strokeWeight(4);
point(340, height * .5 + 50);

// Draw the outer planets.

strokeWeight(85); // Jupiter
point(400, height * .5);

strokeWeight(36); // Saturn's rings
point(500, height * .5 + 5);
stroke(255); // change the stroke color to white (255/255)
strokeWeight(30);
point(500, height * .5 + 1);
stroke(0); // change the stroke color back to black

strokeWeight(24); // Saturn
point(500, height * .5);

strokeWeight(27); // Uranus
point(550, height * .5);

strokeWeight(21); // Neptune
point(600, height * .5);

strokeWeight(6); // Pluto
point(650, height * .5);

save("planets.png");
