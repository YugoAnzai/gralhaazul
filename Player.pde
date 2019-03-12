class Player extends GameObject{

  int state;

  final int ST_FLYING = 1;
  final int ST_LANDED = 2;

  int playerSize = 50;

  float parFlapSpeed = 10;
  boolean flapPressUsed = false;
  float parFlySpeed = 5;

  RectCollider rectCollider;

  Player(int x, int y) {
    super(x, y, 0, "Player");
    state = ST_LANDED;
    rectCollider = new RectCollider(this, colliderManager.player, playerSize, playerSize);
  }

  void draw() {
    fill(30, 10, 200);
    rect(int(pos.x), int(pos.y), playerSize, playerSize);
  }

  void debugDraw(int x, int y){

    String[] lines = {
      "state:" + state,
      "pos.x:" + nfc(pos.x, 1) + " pos.y:" + nfc(pos.y, 1),
      "speed.x:" + nfc(speed.x, 1) + " speed.y:" + nfc(speed.y, 1),
      "acc.x:" + nfc(acc.x, 1) + " acc.y:" + nfc(acc.y, 1),
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));

    rectCollider.debugDraw();

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
    pos.x = constrain(pos.x, 0 + playerSize/2, width - playerSize/2);
    pos.y = constrain(pos.y, 0 + playerSize/2, height - playerSize/2);

    // Update collider position
    rectCollider.process();

  }

  void hit(){
    println("Player hit");
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
