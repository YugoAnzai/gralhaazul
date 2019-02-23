class Player {

  Transform transform;
  Transform speed;
  Transform acc;

  int state;

  final int ST_FLYING = 1;
  final int ST_ON_GROUND = 2;

  int squareSize = 20;

  float parFlapSpeed = 10;
  float parFlySpeed = 5;

  Player(int x, int y) {
    state = ST_ON_GROUND;
    transform = new Transform(x, y, 0);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

  void draw() {
    fill(0,0,0);
    rect(transform.x, transform.y, squareSize, squareSize);
  }

  void debugDraw(){
    fill(255, 0, 0);
    textSize(10);
    text("state:" + state, 0, 10);
  }

  void process(){
    if (state == ST_FLYING) {
      speed.y += globals.gravity - (abs(speed.y * globals.airFriction));
      transform.y += int(speed.y);
    } else if (state == ST_ON_GROUND) {
      speed.y = 0;
    }

    // campl to screen
    transform.x = constrain(transform.x, 0, width - squareSize);
    transform.y = constrain(transform.y, 0, height - squareSize);

  }

  void control(Pressed pressed){
    if (state == ST_ON_GROUND){
      if (pressed.flap) {
        state = ST_FLYING;
        speed.y -= parFlapSpeed;
      }
    }
    if (state == ST_FLYING) {
      if (pressed.flap) {
        speed.y -= parFlapSpeed;
      }
      if (pressed.left) {
        transform.x -= int(parFlySpeed);
      }
      if (pressed.right) {
        transform.x += int(parFlySpeed);
      }
    }

  }
}
