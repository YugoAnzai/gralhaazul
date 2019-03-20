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

  sceneManager = new SceneManager("GameScene");

}

void draw() {

  process();
  _draw();
  debugDraw();

}

void process(){
  input.process();
  sceneManager.currentScene.process();
}

void _draw(){
  sceneManager.currentScene.draw();
}

void debugDraw(){
  input.debugDraw(0, 0);
  sceneManager.currentScene.debugDraw();
}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
