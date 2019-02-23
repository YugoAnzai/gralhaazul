Player player;
Input input;

void setup() {
  size(1000, 700);
  player = new Player(100, 100);
  input = new Input();
}

void draw() {

  background(#2B9D52);

  player.draw();
  player.control(input.pressed);

  // Testes ________________
  // input.debugDraw();
  player.debugDraw();
}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
