class Player {

  Transform pos;
  Transform speed;
  Transform acc;

  int state;

  final int ST_FLYING = 1;
  final int ST_LANDED = 2;

  int playerDiameter = 20;

  float parFlapSpeed = 13;
  boolean flapPressUsed = false;
  float parFlySpeed = 5;

  Player(int x, int y) {
    state = ST_LANDED;
    pos = new Transform(x, y, 0);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

  void draw() {
    fill(0, 0, 0);
    ellipse(int(pos.x), int(pos.y), playerDiameter, playerDiameter);
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
      pos.y += speed.y;
    } else if (state == ST_LANDED) {
      speed.y = 0;
    }

    // clamp to screen
    pos.x = constrain(pos.x, 0 + playerDiameter/2, width - playerDiameter/2);
    pos.y = constrain(pos.y, 0, height - playerDiameter/2);

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
        pos.x -= parFlySpeed;
      }
      if (pressed.right) {
        pos.x += parFlySpeed;
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
