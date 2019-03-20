Globals globals;
Input input;
Debug debug;
ColliderManager colliderManager;
SceneManager sceneManager;

void setup() {

  size(1000, 700);
  rectMode(CENTER);

  globals = new Globals();
  colliderManager = new ColliderManager();
  input = new Input();
  debug = new Debug();

  sceneManager = new SceneManager("SplashScene");

}

void draw() {

  process();
  _draw();
  debugDraw();

}

void process(){
  input.process();
  sceneManager.process();
}

void _draw(){
  sceneManager.draw();
}

void debugDraw(){
  input.debugDraw(0, 0);
  sceneManager.debugDraw();
}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
