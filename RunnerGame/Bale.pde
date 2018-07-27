class Bale {

  PVector pos;
  PVector speed;
  PVector dims;

  Bale () {
    dims = new PVector(20, 30);
    speed = new PVector(-5, 0);
    if (random(1) < .7) {
      pos = new PVector(width + 10, floor_height - dims.y);
    } else {
      pos = new PVector(width + 10, floor_height - 3 * dims.y);
    }
  }

  void draw() {
   fill(0);
   rect(pos.x, pos.y, dims.x, dims.y);
   if (player.life > 0){
    pos.add(speed);
  }
}

boolean safe = false; 
boolean collide(PVector pig_pos, PVector pig_dim) {
    if (pos.x + dims.x >= pig_pos.x &&     // r1 right edge past r2 left
      pos.x <= pig_pos.x + pig_dim.x &&    // r1 left edge past r2 right
      pos.y + dims.y >= pig_pos.y &&       // r1 top edge past r2 bottom
      pos.y <= pig_pos.y + pig_dim.y &&    // r1 bottom edge past r2 top
      !safe) {  // bale has not yet collided
      safe = true;
    return true;
  }
    safe = false; // allow future collision (not necessary for a runner)
    return false;
  }
}
