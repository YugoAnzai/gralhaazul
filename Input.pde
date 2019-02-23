class Pressed {

  boolean right;
  boolean left;
  boolean flap;
  boolean grab;

  Pressed() {
    right = false;
    left = false;
    flap = false;
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
    if(key == ' ') pressed.flap = true;
    if(key == 'j') pressed.grab = true;
  }

  void keyReleased() {
    if(key == 'a') pressed.left = false;
    if(key == 'd') pressed.right = false;
    if(key == ' ') pressed.flap = false;
    if(key == 'j') pressed.grab = false;
  }

 void debugDraw() {
    fill(0);
    rect(0, 0, 80, 90);
    fill(0, 255, 255);
    textSize(12);
    text("left: " + pressed.left, 5, 20);
    text("right: " + pressed.right, 5, 40);
    text("flap: " + pressed.flap, 5, 60);
    text("grab: " + pressed.grab, 5, 80);
  }

}
