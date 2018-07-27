Pig player;
ArrayList<Bale> bales;

float floor_height;

void setup() {
  size(500, 300);
  floor_height = height * 0.6;

  player = new Pig();
  bales = new ArrayList<Bale>();
}

float next_spawn = 0;

void draw() {
  // Spawn new bales at random intervals
  if (millis() > next_spawn) {  // Detect if time has passed
    bales.add(new Bale());      // Create new bale
    next_spawn = millis() + random(1000, 2000);  // Set next spawn time between 1-2 seconds from now
  }
  background(100);
  
  // Draw the player
  player.draw();
  for (Bale b : bales) {
    b.draw();   // Draw each bale
    
    // Check collision with each bale
    if (b.collide(player.pos, player.dims)) {
       // In here you should:
       // Animate the collision (turn something red)
       // Take life from the player
       // Destroy the bale?
       text("ouch", width/2, height/2);
    }
  }
  fill(255, 100);
  rect(0, floor_height, 1000, 300);
}

void keyPressed() {
  player.keyPressed();
}
