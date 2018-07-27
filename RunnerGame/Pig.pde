class Pig {

  int life = 3;
  PVector pos;
  PVector dims;
  PImage avatar;
  int col;

  boolean jump = false;
  boolean slide = false;

  Pig() {
    dims = new PVector(30, 30);
    pos = new PVector(100, floor_height - dims.y);
    col = color(128);
  }

  void draw() {
    fill(col);
    if (slide == false && jump && pos.y + dims.y >= floor_height) {
      pos.y -= 99;
      jump = false;
    }

    if (pos.y + dims.y < floor_height) {
      pos.y += 3;
    }
    
    if (slide == true && jump == false) {
      rect(pos.x, (pos.y+dims.y/2), dims.x, (dims.y/2));
    } else {
      rect(pos.x, pos.y, dims.x, dims.y);
    }
  }


  void keyPressed() {
    if (key == 's') {
      slide = true;
    }
    if (key == 'w') jump = true;

  }

  void keyReleased() {
    slide = false;
  }
}
