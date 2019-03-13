class Player extends GameObject{

  int state;

  final int ST_FLYING = 1;
  final int ST_LANDED = 2;

  RectCollider rectCollider;

  int playerSize = 50;
  float flySpeed = 5;

  int maxStamina;
  int stamina;
  int maxHearts;
  int hearts;

  Player(int x, int y, int _maxStamina, int _maxHearts) {
    super(x, y, 0, "Player");
    maxStamina = _maxStamina;
    stamina = maxStamina;
    maxHearts = _maxHearts;
    hearts = maxHearts;
    state = ST_LANDED;
    rectCollider = new RectCollider(this, colliderManager.player, playerSize, playerSize);
  }

  void draw() {

    fill(130, 110, 250);
    rect(int(pos.x), int(pos.y), playerSize, playerSize);

    // HUD : stamina
    int stX = 300;
    int stY = 25;
    int stW = 600;
    int stH = 15;

    rectMode(CORNER);
    fill(0);
    rect(stX, stY, stW, stH);
    fill(0, 200, 150);
    rect(stX, stY, int(stW * (float(stamina)/maxStamina)), stH);
    rectMode(CENTER);

  }

  void debugDraw(int x, int y){

    String[] lines = {
      "state:" + state,
      "pos.x:" + nfc(pos.x, 1) + " pos.y:" + nfc(pos.y, 1),
      "speed.x:" + nfc(speed.x, 1) + " speed.y:" + nfc(speed.y, 1),
      "acc.x:" + nfc(acc.x, 1) + " acc.y:" + nfc(acc.y, 1),
      "stamina" + stamina,
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));

    rectCollider.debugDraw();

  }

  void process(){
    // Collider process
    rectCollider.process();

    Pressed pressed = input.pressed;

    if (state == ST_LANDED){
      if (pressed.left || pressed.right || pressed.up || pressed.down) {
        state = ST_FLYING;
      }
    }
    if (state == ST_FLYING) {

      stamina --;

      if (pressed.left) {
        pos.x -= flySpeed;
      }
      if (pressed.right) {
        pos.x += flySpeed;
      }
      if (pressed.up) {
        pos.y -= flySpeed;
      }
      if (pressed.down) {
        pos.y += flySpeed;
      }
    }

    // clamp to game screen
    pos.x = constrain(pos.x, 0 + playerSize/2, width - playerSize/2);
    pos.y = constrain(pos.y, 0 + playerSize/2, height - playerSize/2 - 100);

  }

  void hit(){
    println("Player hit");
  }

}
