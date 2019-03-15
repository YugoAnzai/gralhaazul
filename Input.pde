class Pressed {

  boolean right;
  boolean left;
  boolean up;
  boolean down;
  boolean land;
  boolean grab;

  Pressed() {
    right = false;
    left = false;
    up = false;
    down = false;
    land = false;
    grab = false;
  }

}

class Input{

  Pressed pressed;

  Input() {
    pressed = new Pressed();
  }

  void keyPressed(){
    if(key == 'a') pressed.left = true;
    if(key == 'd') pressed.right = true;
    if(key == 'w') pressed.up = true;
    if(key == 's') pressed.down = true;
    if(key == ' ') pressed.land = true;
    if(key == 'j') pressed.grab = true;
  }

  void keyReleased() {
    if(key == 'a') pressed.left = false;
    if(key == 'd') pressed.right = false;
    if(key == 'w') pressed.up = false;
    if(key == 's') pressed.down = false;
    if(key == ' ') pressed.land = false;
    if(key == 'j') pressed.grab = false;
  }

 void debugDraw(int x, int y) {
    String[] lines = {
      "left: " + pressed.left,
      "right: " + pressed.right,
      "up: " + pressed.up,
      "down: " + pressed.down,
      "land: " + pressed.land,
      "grab: " + pressed.grab,
    };
    debug.draw(lines, x, y);
  }

}
