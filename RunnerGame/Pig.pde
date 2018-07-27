class Pig {

  int life = 3;
  PVector pos;
  PVector dims;
  PImage avatar;

  boolean jump = false;

  Pig() {
    dims = new PVector(30, 30);
    pos = new PVector(100, floor_height - dims.y);
  }

  void draw() {
    rect(pos.x, pos.y, dims.x, dims.y);

    if (jump && pos.y + dims.y >= floor_height) {
      pos.y -= 60;
      jump = false;
    }

    if (pos.y + dims.y < floor_height) {
      pos.y++;
    }
  }

  void keyPressed() {
    if (key == 'w') jump = true;
  }
}
