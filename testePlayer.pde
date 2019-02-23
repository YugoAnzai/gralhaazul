Player player;
Input input;
Globals globals;

void setup() {

  size(1000, 700);
  player = new Player(100, 100);
  input = new Input();
  globals = new Globals();

}

void draw() {

  control();
  process();
  _draw();
  debugDraw();

}

void control(){
  player.control(input.pressed);
}

void process(){
  player.process();
}

void _draw(){
  background(#2B9D52);
  player.draw();
}

void debugDraw(){
  input.debugDraw();
  player.debugDraw();
}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
