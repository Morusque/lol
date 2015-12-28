 //<>//
ArrayList<Heart> hearts = new ArrayList<Heart>();

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  for (int i=0; i<20; i++) hearts.add(new Heart(random(1)));
}

void draw() {
  for (int i=0; i<hearts.size (); i++) {
    if (hearts.get(i).life>1) hearts.set(i, new Heart(0));
  }
  for (Heart heart : hearts) heart.draw();
}

class Heart {
  PVector pos = new PVector(random(width), random(height));
  PVector dir = new PVector(random(-1, 1), random(-1, 1));
  color c = color(random(0x100), random(0x80), random(0x50));
  float s = random(10, 30);
  float life=0;
  Heart (float life) {
    this.life=life;
  }
  void draw() {
    fill(red(c)*life, green(c)*life, blue(c)*life);
    float rad = s*life;
    float esp = rad*2.0f/3.0f;
    ellipse(pos.x-esp, pos.y, rad*2, rad*2);
    ellipse(pos.x+esp, pos.y, rad*2, rad*2);
    triangle(pos.x-esp+rad*cos(TWO_PI*3/8), pos.y+rad*sin(TWO_PI*3/8), pos.x+esp+rad*cos(TWO_PI*1/8), pos.y+rad*sin(TWO_PI*1/8), pos.x, pos.y+rad*2);
    pos.x=(pos.x+dir.x+width)%width;
    pos.y=(pos.y+dir.y+height)%height;
    life+=random(0.01);
  }
}
