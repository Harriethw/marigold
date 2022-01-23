
color yellow = #FFF74D;
color lightOrange = #FAC53F;
color mediumOrange = #FFB905;
color darkOrange = #FF980F;

color[] colors = {lightOrange, mediumOrange, darkOrange};

void setup() {
  size(800, 800);
  background(255);
  // noStroke();
  drawRose();
}

void drawRose() {
  translate(width/2, height/2);
  float petalSize = 90;
  float rotation = 45;
  for (int i = 0; i < 7; ++i) {
    drawPetals(petalSize);
    rotate(radians(rotation));
    if (i < 3) {
    petalSize = petalSize / 1.2;
    } else {
      petalSize = petalSize / 1.5;
    }
  }
  drawCenter();
}

void drawPetals(float petalSize) {
  print(petalSize);
  for (int i = 0; i < 5; i++) {
    fill(colors[int(random(3))]);
    ellipse(0, -(petalSize / 1.8), petalSize, petalSize);
    rotate(radians(72));
  }
}

void drawCenter() {
  fill(yellow);
  ellipse(0, 0, 10, 10);
}

