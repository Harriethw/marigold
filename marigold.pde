
color yellow = #FFF74D;
color lightOrange = #FAC53F;
color mediumOrange = #FFB905;
color darkOrange = #FF980F;

color[] colors = {lightOrange, mediumOrange, darkOrange,mediumOrange, darkOrange};

int maxLayers = 9;
int layers = 3;
float petalSize = 10;
boolean isGrowing = true;

PImage img;

void setup() {
  size(500, 700, P3D);
  ortho();
  frameRate(3);
  img = loadImage("illustration.jpg");
  // noStroke();
}

void draw() {
  background(#F47983);
  drawImage();
  drawText();
  translate(260, 240);
  drawRose();
  // drawRow();
  // translate(0, 300);
  // drawRow();
  // translate(0, 300);
  // drawRow();
  changeLayers();

  // noLoop();
  setIsGrowing();
}

void drawImage () {
  pushMatrix();
    translate(0, 0, -400);
    tint(0, 153, 204); 
    image(img, 0, 0);
  popMatrix();
}

void drawText () {
  pushMatrix();
    translate(0, 0, -399);
    textSize(100);
    text("marigold", 40, 120);
  popMatrix();
}

void drawRow () {
  pushMatrix();
  translate(150, 150);
  drawRose();
  translate(300, 0);
  drawRose();
  translate(300, 0);
  drawRose();
  popMatrix();
}


void drawRose() {
  float rotation = 45;
  float layerPetalSize = petalSize;
  pushMatrix();
  for (int i = 0; i < layers; ++i) {
    translate(0,0, -i);
    drawPetals(layerPetalSize);
    // rotate(radians(rotation));
    if (i < (maxLayers /2)) {
    layerPetalSize = layerPetalSize * 1.4;
    } else {
      layerPetalSize = layerPetalSize * 1.5;
    }
  }
  popMatrix();
  drawCenter();
}

void changeLayers() {
  if (isGrowing) {
    layers = layers + 1;
  } else {
    layers = layers - 1;
  }
}

void drawPetals(float petalSize) {
  //TODO: increase number of petals depending on layer;
  //TODO: grow petals over time until max size, then move on to next layer - have a variable to hold which layer is growing
  for (int i = 0; i < 8; i++) {
    translate(0,0, -i);
    fill(colors[int(random(3))]);
    // fill(colors[i]);
    ellipse(0, -(petalSize / 1.8), petalSize, petalSize);
    rotate(radians(45));
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
  if (layers == maxLayers){
    isGrowing = false;
  } else if (layers == 1) {
    isGrowing = true;
  }
}

