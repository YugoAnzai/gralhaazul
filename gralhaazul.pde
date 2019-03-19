Globals globals;
Player player;
World world;
Input input;
Debug debug;
ColliderManager colliderManager;

void setup() {

  size(1000, 700);
  rectMode(CENTER);

  globals = new Globals();
  colliderManager = new ColliderManager();
  player = new Player(width/2, height/2, 300, 2, 3);
  world = new World(player);
  input = new Input();
  debug = new Debug();

}

void draw() {

  process();
  _draw();
  debugDraw();

}

void process(){
  input.process();
  world.process();
  player.process();
}

void _draw(){
  world.draw();
  player.draw();
}

void debugDraw(){
  input.debugDraw(0, 0);
  world.debugDraw(0, 150);
  player.debugDraw(80, 0);
}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
