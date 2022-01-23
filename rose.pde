
color yellow = #FFF74D;
color lightOrange = #FAC53F;
color mediumOrange = #FFB905;
color darkOrange = #FF980F;

color[] colors = {lightOrange, mediumOrange, darkOrange,mediumOrange, darkOrange};

void setup() {
  size(800, 800);
  frameRate(10);
  // noStroke();
  draw();
}

void draw() {
  background(255);
  drawRose();
}


void drawRose() {
  translate(width/2, height/2);
  float petalSize = 400;
  float rotation = 45;
  for (int i = 0; i < 30; ++i) {
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
  for (int i = 0; i < 5; i++) {
    // fill(colors[int(random(3))]);
    fill(colors[i]);
    ellipse(0, -(petalSize / 1.8), petalSize, petalSize);
    // rotate(radians(72));
    rotate(radians(frameCount + mouseX));
  }
}

void drawCenter() {
  fill(yellow);
  ellipse(0, 0, 10, 10);
}

