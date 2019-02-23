class Player {

  Transform transform;
  Transform speed;
  Transform acc;

  int state;

  final int ST_FLYING = 1;
  final int ST_LANDED = 2;

  int squareSize = 20;

  float parFlapSpeed = 13;
  boolean flapPressUsed = false;
  float parFlySpeed = 5;

  Player(int x, int y) {
    state = ST_LANDED;
    transform = new Transform(x, y, 0);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

  void draw() {
    fill(0, 0, 0);
    rect(transform.x, transform.y, squareSize, squareSize);
  }

  void debugDraw(int x, int y){
    String[] lines = {
      "state:" + state
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));
  }

  void process(){

    if (flapPressUsed && !input.pressed.flap) flapPressUsed = false;

    if (state == ST_FLYING) {
      speed.y += globals.gravity - (abs(speed.y * globals.airFriction));
      transform.y += int(speed.y);
    } else if (state == ST_LANDED) {
      speed.y = 0;
    }

    // campl to screen
    transform.x = constrain(transform.x, 0, width - squareSize);
    transform.y = constrain(transform.y, 0, height - squareSize);

  }

  void control(Pressed pressed){
    if (state == ST_LANDED){
      if (pressed.flap) {
        state = ST_FLYING;
        flap();
      }
    }
    if (state == ST_FLYING) {
      if (pressed.flap) {
        flap();
      }
      if (pressed.left) {
        transform.x -= int(parFlySpeed);
      }
      if (pressed.right) {
        transform.x += int(parFlySpeed);
      }
    }

  }

  void flap(){
    if (!flapPressUsed) {
      speed.y = -parFlapSpeed;
      flapPressUsed = true;
    }
  }

}
