int c = 10;
int r = 10;
int cr = 0;
int rr = 0;
float p ;
void setup() {
  size(1920, 1080);
  
  //image(i, 0, 0);
  
}

void keyPressed(){
  PImage im = loadImage("001.png");
  PImage app;
  image(im, 0, 0);
  for (int i = 0; i < r; i++) {
    for (int j = 0; j < c; j++) {
      cr = (int)random(c);
      rr = (int)random(r);
      pushMatrix();
      translate((width / c) * j, (height / r) * i);
      rotate(radians(random(360)));
      app = get((width / c) * cr, (height / r) * rr, (width / c), (height / c));

      //image(app, (width / c) * j, (height / r) * i);
      p = random(1);
      if (p< 0.5) {
        image(app, 0, 0);
      } else {
        if (p > 0.5 && p < 0.75) {
          color c = get(cr, rr);
          fill(c);
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

void mousePressed(){
  saveFrame("###.jpg");
}

void draw() {
}
