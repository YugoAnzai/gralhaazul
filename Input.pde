class Pressed {

  boolean right = false;
  boolean left = false;
  boolean up = false;
  boolean down = false;
  boolean land = false;
  boolean grab = false;
  boolean debug = false;

  Pressed() {

  }

  void copyPressed(Pressed pressed) {

    right = pressed.right;
    left = pressed.left;
    up = pressed.up;
    down = pressed.down;
    land = pressed.land;
    grab = pressed.grab;
    debug = pressed.debug;

  }

}

class Input{

  Pressed rawInputPressed;
  Pressed pressed;
  Pressed pressedLastFrame;
  Pressed keyEnter;
  Pressed keyExit;

  Input() {
    rawInputPressed = new Pressed();
    pressed = new Pressed();
    pressedLastFrame = new Pressed();
    keyEnter = new Pressed();
    keyExit = new Pressed();
  }

  void process(){
    pressed.copyPressed(rawInputPressed);

    keyEnter.left = (pressed.left && !pressedLastFrame.left);
    keyEnter.right = (pressed.right && !pressedLastFrame.right);
    keyEnter.up = (pressed.up && !pressedLastFrame.up);
    keyEnter.down = (pressed.down && !pressedLastFrame.down);
    keyEnter.land = (pressed.land && !pressedLastFrame.land);
    keyEnter.grab = (pressed.grab && !pressedLastFrame.grab);
    keyEnter.debug = (pressed.debug && !pressedLastFrame.debug);

    keyExit.left = (!pressed.left && pressedLastFrame.left);
    keyExit.right = (!pressed.right && pressedLastFrame.right);
    keyExit.up = (!pressed.up && pressedLastFrame.up);
    keyExit.down = (!pressed.down && pressedLastFrame.down);
    keyExit.land = (!pressed.land && pressedLastFrame.land);
    keyExit.grab = (!pressed.grab && pressedLastFrame.grab);
    keyExit.debug = (!pressed.debug && pressedLastFrame.debug);

    pressedLastFrame.copyPressed(pressed);
  }

  void keyPressed(){
    if(key == 'a') rawInputPressed.left = true;
    if(key == 'd') rawInputPressed.right = true;
    if(key == 'w') rawInputPressed.up = true;
    if(key == 's') rawInputPressed.down = true;
    if(key == ' ') rawInputPressed.land = true;
    if(key == 'j') rawInputPressed.grab = true;
    if(key == 'p') rawInputPressed.debug = true;
  }

  void keyReleased() {
    if(key == 'a') rawInputPressed.left = false;
    if(key == 'd') rawInputPressed.right = false;
    if(key == 'w') rawInputPressed.up = false;
    if(key == 's') rawInputPressed.down = false;
    if(key == ' ') rawInputPressed.land = false;
    if(key == 'j') rawInputPressed.grab = false;
    if(key == 'p') rawInputPressed.debug = false;
  }

 void debugDraw(int x, int y) {
    String[] lines = {
      "left: " + pressed.left,
      "right: " + pressed.right,
      "up: " + pressed.up,
      "down: " + pressed.down,
      "land: " + pressed.land,
      "grab: " + pressed.grab,
      "debug: " + pressed.debug,
    };
    debug.draw(lines, x, y);
  }

}
