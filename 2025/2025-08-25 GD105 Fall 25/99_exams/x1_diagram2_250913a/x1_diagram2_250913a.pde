size(1600, 1600);
background(255);
strokeCap(PROJECT);
scale(16);
square(0, 0, 100); // border

save("blank.png");

textFont(createFont("Noto Serif", 6));
fill(0);
textAlign(CENTER, BOTTOM);

line(25, 25, 75, 75); // A
text("Ⓐ", 23, 24);

line(50, 25, 25, 50); // B
text("Ⓑ", 52, 24);

line(25, 75, 75, 25); // C
text("Ⓒ", 77, 24);

textAlign(LEFT, CENTER);

line(75, 50, 50, 75); // D
text("Ⓓ", 77, 49);

line(50, 75, 75, 100); // E
text("Ⓔ", 75, 95);

save("diagram2.png");
