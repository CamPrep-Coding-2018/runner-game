# runner-game

Pig player;
bale bales;
PVector floorarea;

ArrayList<bale> bale;

void setup(){
  size(500,300);
  floorarea = new PVector(500, 200);
  
    player = new Pig();
}

void draw(){
 background(100);
 player.draw();
 bale.draw();
 rect(0,230, 1000,300);

 }

void keyPressed() {
      player.keyPressed(); 
}
