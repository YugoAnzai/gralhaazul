Player player;
World world;
Input input;
Globals globals;
Debug debug;

void setup() {

  size(1000, 700);
  rectMode(CENTER);
  
  player = new Player(width/2, height/2);
  world = new World(player);
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
  world.draw();
  player.draw();
}

void debugDraw(){
  input.debugDraw(0, 0);
  player.debugDraw(80, 0);
  world.debugDraw(0, 150);
}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
