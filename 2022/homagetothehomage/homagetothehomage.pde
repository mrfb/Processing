// Based off of this Josef Albers painting:
// https://www.metmuseum.org/art/collection/search/488725

// drawn numerically on a 100x100 canvas and upscaled

size(500, 500);
scale(5);

color blue, olive, pimento;

blue = #A8C3DE;
olive = #769835;
pimento = #D46032;
noStroke();

background(blue);
fill(olive);
square(10, 15, 80);
fill(pimento);
square(30, 45, 40);

save("output.png");
