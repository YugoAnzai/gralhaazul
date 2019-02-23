Player player;
Input input;
Globals globals;
Debug debug;

void setup() {

  size(1000, 700);
  player = new Player(100, 100);
  input = new Input();
  globals = new Globals();
  debug = new Debug();

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
  input.debugDraw(0, 0);
  player.debugDraw(80, 0);
}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
