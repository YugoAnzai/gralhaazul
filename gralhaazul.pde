import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Globals globals;
Input input;
Debug debug;
ColliderManager colliderManager;
SceneManager sceneManager;
SoundManager soundManager;
TextBox globalTextBox;

long maxMemory;
long allocatedMemory;
long freeMemory;

void setup() {

  size(1000, 700);
  rectMode(CENTER);
  imageMode(CENTER);

  textFont(createFont("brlnsr.ttf", 48));

  globals = new Globals();
  colliderManager = new ColliderManager();
  input = new Input();
  debug = new Debug();
  soundManager = new SoundManager(this);
  globalTextBox = new TextBox(500, 612);

  sceneManager = new SceneManager("GameScene");
  // sceneManager = new SceneManager("CutsceneScene");
  // sceneManager = new SceneManager("EndScene");
  // sceneManager = new SceneManager("OverworldScene");
  // sceneManager = new SceneManager("SplashScene");

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
  }
  if (input.keyEnter.cheat) {
    globals.cheat = !globals.cheat;
  }
  if (input.keyEnter.unlock) {
    globals.unlock = !globals.unlock;
  }
  if (input.keyEnter.mute) {
    if (globals.soundOn) soundManager.pauseAllLoops();
    globals.soundOn = !globals.soundOn;
  }

  maxMemory = Runtime.getRuntime().maxMemory();
  allocatedMemory = Runtime.getRuntime().totalMemory();
  freeMemory = Runtime.getRuntime().freeMemory();

}

void _draw(){
  sceneManager.draw();

  if (globals.cheat) {
    textSize(10);
    fill(255);
    text("cheat: stamina e nuvens", 10, 680);
  }

  if (globals.unlock) {
    textSize(10);
    fill(255);
    text("cheat: tudo desbloqueado", 10, 687);
  }
  if (!globals.soundOn) {
    textSize(10);
    fill(255);
    text("mute", 10, 694);
  }

}

void debugDraw(){

  if (globals.debug) {
    input.debugDraw(0, 0);
    sceneManager.debugDraw();
  }

  // textSize(10);
  // fill(255);
  // text("maxMemory " + maxMemory, 10, 670);
  // text("allocatedMemory " + allocatedMemory, 10, 680);
  // text("freeMemory " + freeMemory, 10, 690);

}

void keyPressed(){
  input.keyPressed();
}

void keyReleased(){
  input.keyReleased();
}
