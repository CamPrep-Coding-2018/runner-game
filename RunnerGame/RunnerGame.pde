Pig player;
ArrayList<Bale> bales;
Bale bale_to_remove;

float floor_height;

void setup() {
  size(500, 300);
  floor_height = height * 0.6;

  player = new Pig();
  bales = new ArrayList<Bale>();
}

float next_spawn = 0;

void draw() {
  println(player.life);
  if (player.life >0) {
    // Spawn new bales at random intervals
    if (millis() > next_spawn) {  // Detect if time has passed
      bales.add(new Bale());      // Create new bale
      next_spawn = millis() + random(500, 1500);  // Set next spawn time between 1-2 seconds from now
    }
  } else {
    println("GAME OVER");
  }
  background(100);

  // Draw the player
  player.draw();
  
  // Life bar
  for (int i = 0; i < player.life; i++) {
    fill(255,0,0);
    ellipse(width/2 + i * width/10, 50, 30, 30);
  }

  for (Bale b : bales) {
    b.draw();   // Draw each bale
    if (b.pos.x < -100) {
      bale_to_remove = b;
    }
    // Check collision with each bale
    if (b.collide(player.pos, player.dims)) {
      bale_to_remove = b;
      player.col = color(255, 0, 0);
      player.life --;
      // In here you should:
      // Animate the collision (turn something red)
      // Take life from the player
      // Destroy the bale?
    }
  }
  bales.remove(bale_to_remove);
  
  fill(255, 100);
  rect(0, floor_height, 1000, 300);
}

void keyPressed() {
  player.keyPressed();
}
void keyReleased() {
  player.keyReleased();
}
