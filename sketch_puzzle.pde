int c = 10;
int r = 10;
int cr = 0;
int rr = 0;
float p ;
PImage[] appV;
PImage immO;
void setup() {
  size(1920, 1080);

  //image(i, 0, 0);
}

void keyPressed() {
  immO = loadImage("001.jpg");
  appV =new PImage[r * c];
  int count = 0;
  image(immO, 0, 0);
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      cr = (int)random(c);
      rr = (int)random(r);
      
      appV[count++] = get((width / c) * cr, (height / r) * rr, (width / c), (height / c));
      println(count);
    }
  }
  drawPieces();
}

void drawPieces() {
  println("drawPieces");
  image(immO, 0,0);
  int l = appV.length - 2, count = 0;
  color  col;
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      pushMatrix();
      translate((width / c) * j, (height / r) * i);
      rotate(radians(random(360)));
      
      //image(app, (width / c) * j, (height / r) * i);
      p = random(1);
      if (p< 0.5) {
        image(appV[(int)random(appV.length)], 0, 0);
      } else {
        if (p > 0.5 && p < 0.75) {
          col = get(cr, rr);
          fill(col);
          //noStroke();
          rect(0, 0, (width / c), (height / r));
        } else {
          fill(0);
          //noStroke();
          rect(0, 0, (width / (int)random(1, 100)), (height / (int)random(1, r / 100)));
        }
      }
      popMatrix();
    }
  }
}

void mousePressed() {
  saveFrame("###.jpg");
}

void draw() {
}
