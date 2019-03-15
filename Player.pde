class Player extends GameObject{
  // States
  final int ST_FLYING = 1;
  final int ST_LANDED = 2;
  final int ST_FALLING = 3;
  int state;

  // collision, size
  int playerSize = 50;
  RectCollider rectCollider;
  int playerColliderW = 30;
  int playerColliderH = 30;

  // stamina
  int staminaFlyingConsumeSpeed = 1;
  int staminaCarryingConsumeSpeed = 2;
  int maxStamina;
  int staminaRecoverySpeed;
  int stamina;
  // hearts
  int maxHearts;
  int hearts;

  float flySpeed = 4;
  int carriedYOffset = 30;
  GameObject carried = null;


  Player(int x, int y, int _maxStamina, int _staminaRecoverySpeed, int _maxHearts) {
    super(x, y, 0, "Player");
    maxStamina = _maxStamina;
    stamina = maxStamina;
    staminaRecoverySpeed = _staminaRecoverySpeed;
    maxHearts = _maxHearts;
    hearts = maxHearts;
    state = ST_LANDED;
    rectCollider = new RectCollider(this, colliderManager.player, playerColliderW, playerColliderH);
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
    int w;
    if (stamina == 0) w = 0;
    else w = int(stW * (float(stamina)/maxStamina));
    rect(stX, stY, w, stH);
    rectMode(CENTER);

  }

  void debugDraw(int x, int y){

    String[] lines = {
      "state:" + state,
      "pos.x:" + nfc(pos.x, 1) + " pos.y:" + nfc(pos.y, 1),
      "speed.x:" + nfc(speed.x, 1) + " speed.y:" + nfc(speed.y, 1),
      "acc.x:" + nfc(acc.x, 1) + " acc.y:" + nfc(acc.y, 1),
      "stamina: " + stamina,
      "carrying: " + (carried == null ? "null" : carried.name),
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));

    rectCollider.debugDraw();

  }

  void process(){
    // Collider process
    RectCollider collided = rectCollider.process();
    Pressed pressed = input.pressed;

    if (state == ST_LANDED){

      stamina += staminaRecoverySpeed;

      if (pressed.left || pressed.right || pressed.up || pressed.down) {
        state = ST_FLYING;
        return;
      }

    } else if (state == ST_FLYING) {

      boolean landed = checkTreeAndLand(collided, pressed);
      if (landed) return;

      if (carried == null) {
        stamina -= staminaFlyingConsumeSpeed;
      } else {
        stamina -= staminaCarryingConsumeSpeed;
      }

      if (stamina == 0) {
        state = ST_FALLING;
        return;
      }

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

      if (pos.y > (globals.floorY) - playerSize/2) {
        pos.y = globals.floorY - playerSize/2;
        state = ST_LANDED;
        return;
      }

    } else if (state == ST_FALLING) {

      boolean landed = checkTreeAndLand(collided, pressed);
      if (landed) return;

      pos.y = pos.y + globals.fallSpeed;

      if (pos.y >= (600) - playerSize/2) {
        pos.y = 600 - playerSize/2;
        state = ST_LANDED;
        return;
      }

    }

    // clamp to game screen
    pos.x = constrain(pos.x, 0 + playerSize/2, width - playerSize/2);
    pos.y = constrain(pos.y, 0 + playerSize/2, height - playerSize/2 - 100);

    // constrain stamina
    stamina = constrain(stamina, 0, maxStamina);

  }

  boolean checkTreeAndLand(RectCollider collided, Pressed pressed){
    if (collided != null && collided.gameObject.name == "TreePart" && pressed.land) {
      TreePart treePart = (TreePart)collided.gameObject;
      pos.y = treePart.pos.y;
      state = ST_LANDED;
      return true;
    }
    return false;
  }

  void hit(){
    println("Player hit");
  }

}
