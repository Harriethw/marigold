
color yellow = #FFF74D;
color lightOrange = #FAC53F;
color mediumOrange = #FFB905;
color darkOrange = #FF980F;

color[] colors = {lightOrange, mediumOrange, lightOrange, mediumOrange, darkOrange};

int maxLayers = 9;
int layers = 3;
float petalSize = 10;
boolean isGrowing = true;

PImage img;

float t = 0; // time passed
float tChange = .02; // how quick time flies

void setup() {
  size(500, 730, P3D);
  ortho();
  frameRate(3);
  img = loadImage("illustration.jpg");
  // noStroke();
}
int x = 0;
void draw() {
  background(#F47983);
  drawImage();
  drawText();
  pushMatrix();
    translate(80, 450);
    drawRose();
  popMatrix();
  pushMatrix();
    translate(260, 240);
    drawRose();
  popMatrix();
  pushMatrix();
    translate(340, 550);
    drawRose();
  popMatrix();
  // drawRow();
  // translate(0, 300);
  // drawRow();
  // translate(0, 300);
  // drawRow();
  changeLayers();

  // noLoop();
  setIsGrowing();
  // if (x < 100) {
  //   x = x + 1;
  // } else {
  //   noLoop();
  // }
  // // Saves each frame as screen-0001.tif, screen-0002.tif, etc.
  // saveFrame(); 
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
    textSize(80);
    textLeading(90);
    text("all things \nchange", 40, 100);
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
  //TODO: grow petals over time until max size, then move on to next layer - have a variable to hold which layer is growing
  for (int i = 0; i < 8; i++) {
    translate(0,0, -i);
    fill(colors[int(random(3))]);
    // fill(colors[i]);
    // ellipse(0, -(petalSize / 1.8), petalSize, petalSize);

    drawPetal(petalSize);
    rotate(radians(45));
  }
}

void drawPetal(float petalSize) {
  float nInt = 2.491;
  float nAmp = 0.51;
  float resolution = 300; // how many points in the circle
  beginShape();
  for (float a=0; a<=TWO_PI; a+=TWO_PI/resolution) {
    float nVal = map(noise( cos(a)*nInt+1, sin(a)*nInt+1, t), 0.0, 1.0, nAmp, 1.0); // map noise value to match the amplitude

    float x = cos(a)*petalSize *nVal;
    float y = sin(a)*petalSize *nVal;

    vertex(x, y); 
  }
  endShape(CLOSE);

  t += tChange;
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

