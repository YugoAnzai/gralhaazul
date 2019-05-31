class Player extends GameObject{
  // States
  final int ST_FLYING = 1;
  final int ST_LANDED = 2;
  final int ST_FALLING = 3;
  int state;

  // collision, size
  int playerSize = 20;
  RectCollider[] collided;
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
  Animator heart;

  // carry
  int carriedYOffset = 40;
  GameObject carried = null;

  float flySpeed = 5;

  Player(int x, int y, int _maxStamina, int _staminaRecoverySpeed, int _maxHearts) {
    super(x, y, "Player");
    maxStamina = _maxStamina;
    stamina = maxStamina;
    staminaRecoverySpeed = _staminaRecoverySpeed;
    maxHearts = _maxHearts;
    hearts = maxHearts;
    state = ST_LANDED;
    rectCollider = new RectCollider(this, colliderManager.player, playerColliderW, playerColliderH);

    anim = new Animator(0, 0, "crow.png", 3, 3);

    int[] animSprites = new int[]{0, 1, 2, 3, 4, 3, 2, 1, 0};
		int[] animDuration = new int[]{5, 9, 9, 9, 9, 4, 4, 4, 2};
		anim.createAnimation("flying", animSprites, animDuration);

		animSprites = new int[]{5, 6};
		animDuration = new int[]{12, 12};
		anim.createAnimation("idle", animSprites, animDuration);

		animSprites = new int[]{7, 8};
		animDuration = new int[]{8, 8};
		anim.createAnimation("falling", animSprites, animDuration);

		anim.setAnimation("idle");
    anim.play();

    heart = new Animator(0, 0, "heart.png", 1, 1);
    heart.createAnimation("idle", new int[]{0}, new int[]{99});
    heart.setAnimation("idle");

  }

  void draw() {
    super.draw();

    // HUD : stamina
    int stX = 350;
    int stY = 640;
    int stW = 500;
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

    // HUD hearts;
    stX = 100;
    stY = 650;

    for (int i = 0; i < hearts; i++) {
      stX += 50;
      heart.x = stX;
      heart.y = stY;
      heart.draw();
    }

  }

  void debugDraw(int x, int y){

    super.debugDraw();

    String[] lines = {
      "state:" + state,
      "pos.x:" + nfc(pos.x, 1) + " pos.y:" + nfc(pos.y, 1),
      "speed.x:" + nfc(speed.x, 1) + " speed.y:" + nfc(speed.y, 1),
      "acc.x:" + nfc(acc.x, 1) + " acc.y:" + nfc(acc.y, 1),
      "stamina: " + stamina,
      "carried: " + (carried == null ? "null" : carried.name),
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));

  }

  void process(){
    // Collider process
    collided = rectCollider.process();

    stateProcess();

    // clounds
    if (carried == null) {
      checkCloudInteraction();
      checkPineAndCarry();
    } else {
      checkPineRelease();
    }

    updateCarried();

    // clamp to game screen
    pos.x = constrain(pos.x, 0 + playerSize/2, width - playerSize/2);
    pos.y = constrain(pos.y, 0 + playerSize/2, height - playerSize/2 - 100);

    // constrain stamina
    stamina = constrain(stamina, 0, maxStamina);

  }

  void stateProcess() {
    if (state == ST_LANDED){

      if (checkAndPutOnFloor()){
        if (input.pressed.left || input.pressed.right) {
          movePlayerWithPressed();
        }
        if (input.pressed.up) {
          anim.setAnimation("flying");
          state = ST_FLYING;
          return;
        }
      } else {
        if (input.pressed.left || input.pressed.right || input.pressed.up || input.pressed.down) {
          anim.setAnimation("flying");
          state = ST_FLYING;
          return;
        }
      }

      stamina += staminaRecoverySpeed;

    } else if (state == ST_FLYING) {

      boolean landed = checkTreeAndLand();

      if (landed) {
        anim.setAnimation("idle");
        state = ST_LANDED;
        return;
      }

      // stamina consumption
      if (!globals.cheat) {
        if (carried == null) {
          stamina -= staminaFlyingConsumeSpeed;
        } else {
          stamina -= staminaCarryingConsumeSpeed;
        }
      }

      if (stamina <= 0) {
        anim.setAnimation("falling");
        state = ST_FALLING;
        return;
      }

      movePlayerWithPressed();

      if (checkAndPutOnFloor()) {
        anim.setAnimation("idle");
        state = ST_LANDED;
        return;
      }

    } else if (state == ST_FALLING) {

      boolean landed = checkTreeAndLand();
      if (landed) {
        anim.setAnimation("idle");
        state = ST_LANDED;
        return;
      }

      pos.y = pos.y + globals.fallSpeed;

      if (checkAndPutOnFloor()) {
        anim.setAnimation("idle");
        state = ST_LANDED;
        return;
      }

    }
  }

  void movePlayerWithPressed() {
    if (input.pressed.left) {
      anim.flipped = false;
      pos.x -= flySpeed;
    }
    if (input.pressed.right) {
      anim.flipped = true;
      pos.x += flySpeed;
    }
    if (input.pressed.up) {
      pos.y -= flySpeed;
    }
    if (input.pressed.down) {
      pos.y += flySpeed;
    }
  }

  void updateCarried(){
    if (carried == null) return;
    carried.pos.x = pos.x;
    carried.pos.y = pos.y + carriedYOffset;
  }

  boolean checkPineRelease(){
    if (carried != null && input.keyEnter.grab) {
      if (carried.name == "Pine"){
        Pine pine = (Pine)carried;
        pine.falling = true;
      }
      carried = null;
      return true;
    }
    return false;
  }

  boolean checkPineAndCarry(){
    Pine pine = (Pine)globals.world.getGameObjectFromCollided(collided, "Pine");
    if (pine != null && input.keyEnter.grab) {
      carried = pine;
      pine.pickup();
      soundManager.playSound("crow_grab");
      return true;
    }
    return false;
  }

  boolean checkTreeAndLand(){
    TreePart treePart = (TreePart)globals.world.getGameObjectFromCollided(collided, "TreePart");
    boolean notMovingInputs = !input.pressed.right && !input.pressed.left && !input.pressed.up && !input.pressed.down;
    if (treePart != null && notMovingInputs) {
      pos.y = treePart.pos.y;
      return true;
    }
    return false;
  }

  boolean checkAndPutOnFloor(){
    if (pos.y >= (globals.floorY) - playerSize/2) {
      pos.y = globals.floorY - playerSize/2;
      return true;
    }
    return false;
  }

  boolean checkCloudInteraction() {
    Cloud cloud = (Cloud)globals.world.getGameObjectFromCollided(collided, "Cloud");
    if (cloud != null && input.keyEnter.grab) {
      cloud.interact();
      return true;
    }
    return false;
  }

  void bulletHit(){
    soundManager.playSound("crow_hit");
    hearts--;
    if (hearts <= 0) {
      sceneManager.changeScene("GameOverScene");
    }
  }

  void destroy() {
  }

}
