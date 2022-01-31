
color yellow = #FFF74D;
color lightOrange = #FAC53F;
color mediumOrange = #FFB905;
color darkOrange = #FF980F;

color[] colors = {lightOrange, mediumOrange, darkOrange,mediumOrange, darkOrange};

int layers = 1;
float petalSize = 20;
boolean isGrowing = true;

void setup() {
  size(800, 800, P3D);
  frameRate(6);
  // noStroke();
  draw();
}

void draw() {
  background(255);
  drawRose();
  // noLoop();
  println("layers: "+layers);
  println("petalSize: "+petalSize);
  setIsGrowing();
}


void drawRose() {
  translate(width/2, height/2);
  float rotation = 45;
  float layerPetalSize = petalSize;
  pushMatrix();
  for (int i = 0; i < layers; ++i) {
    translate(0,0, -i);
    drawPetals(layerPetalSize);
    // rotate(radians(rotation));
    if (i < 7) {
    layerPetalSize = layerPetalSize * 1.4;
    } else {
      layerPetalSize = layerPetalSize * 1.5;
    }
  }
  popMatrix();
  if (isGrowing) {
    layers = layers + 1;
  } else {
    layers = layers - 1;
  }
  drawCenter();
}

void drawPetals(float petalSize) {
  //TODO: increase number of petals depending on layer;
  //TODO: grow petals over time until max size, then move on to next layer - have a variable to hold which layer is growing
  for (int i = 0; i < 5; i++) {
    translate(0,0, -i);
    // fill(colors[int(random(3))]);
    fill(colors[i]);
    ellipse(0, -(petalSize / 1.8), petalSize, petalSize);
    rotate(radians(72));
    // rotate(radians(frameCount + mouseX));
  }
}

void drawCenter() {
  pushMatrix();
    translate(0,0,+1);
    fill(yellow);
    ellipse(0, 0, 10, 10);
  popMatrix();
}

void setIsGrowing() {
  if (layers == 13){
    isGrowing = false;
  } else if (layers == 1) {
    isGrowing = true;
  }
}

