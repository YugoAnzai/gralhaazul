Globals globals;
Input input;
Debug debug;
ColliderManager colliderManager;
SceneManager sceneManager;
SoundManager soundManager;

void setup() {

  size(1000, 700);
  rectMode(CENTER);
  imageMode(CENTER);

  globals = new Globals();
  colliderManager = new ColliderManager();
  input = new Input();
  debug = new Debug();
  soundManager = new SoundManager(this);

  // sceneManager = new SceneManager("SplashScene");
  sceneManager = new SceneManager("GameScene");
  // sceneManager = new SceneManager("TestScene");

}

void draw() {

  process();
  _draw();
  debugDraw();

}

void process(){
  input.process();
  sceneManager.process();

  if (input.keyEnter.debug) {
    globals.debug = !globals.debug;
    if (!globals.debug) {
      stroke(0);
    }
  }

}

void _draw(){
  sceneManager.draw();
}

void debugDraw(){

  if (globals.debug) {
    input.debugDraw(0, 0);
    sceneManager.debugDraw();
  }

}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
