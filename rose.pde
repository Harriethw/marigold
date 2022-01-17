void setup() {
  size(800, 800);
  background(255);
  noStroke();
  drawRose();
}

void drawRose() {
  translate(width/2, height/2);
  fill(#c6ff89); // green
  for (int i = 0; i < 5; i++) {
    ellipse(0, -40, 50, 50);
    rotate(radians(72));
  }
  fill(#FFC0CB); //pink
  ellipse(0, 0, 50, 50);
}

