class Globals {

  boolean debug = false;
  boolean cheat = false;
  boolean unlock = false;

  float fallSpeed = 3;
  int floorY = 600;

  // Config
  boolean soundOn = true;

  // game Globals
  World world;
  int level = -1;
  boolean gameEnded = false;
  boolean sawCutscene = false;

  // Overworld
  int selectedLevel = 1;
  boolean level2locked = true;
  boolean level3locked = true;

  // debug
  boolean skipToGame = false;
  boolean skipToOverworld = false;

  Globals() {
    // override debug

    // soundOn = false;
    // sawCutscene = true;
    // level2locked = false;
    // level3locked = false;
    // level = -3;
    // skipToGame = true;
    // skipToOverworld = true;

  }

}
