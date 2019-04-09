class Hunter extends Enemy{

	// States
	final int ST_WALKING = 1;
	final int ST_CUTTING_PINE = 2;
	final int ST_FLEEING = 3;
	final int ST_AIMING = 4;
	final int ST_SHOOTING = 5;
	int state;

	Player player;

	boolean stWaDirRight = true;
	int stWaChangeDirMaxCount = 80;
	int stWaChangeDirMinCount = 20;
	int stWaChangeDirCount;
	float stWaSpeed = 0.9;
	int stWaSightRd = 200;
	int stWaVertSightX = 120;
	int stWaVertSightY = 500;

	int stCuCutMaxCount = 300;
	int stCuCutCount = stCuCutMaxCount;
	Pine stCuPineBeingCut;

	int stAiMaxCount = 80;
	int stAiCount = stAiMaxCount;
	float stSpeed = 4;

	int stShRecoverMaxCount = 150;
	int stShRecoverCount = stShRecoverMaxCount;

	Hunter(int x) {
		// hunter anchor is on the center of his feet
		super(x, globals.floorY, "Hunter", 30, 80, 0, -50);

		anim = new Animator(0, -50, "hunter.png", 2, 2);

		player = globals.world.player;

    int[] animSprites = new int[]{0};
		int[] animDuration = new int[]{99};
		anim.createAnimation("walking", animSprites, animDuration);
		animSprites = new int[]{1};
		animDuration = new int[]{99};
		anim.createAnimation("cutting_pine", animSprites, animDuration);
		animSprites = new int[]{2};
		animDuration = new int[]{99};
		anim.createAnimation("aiming", animSprites, animDuration);
		animSprites = new int[]{3};
		animDuration = new int[]{99};
		anim.createAnimation("shooting", animSprites, animDuration);
		animSprites = new int[]{1,2};
		animDuration = new int[]{2,2};
		anim.createAnimation("hit", animSprites, animDuration);

		anim.setAnimation("walking");
    anim.play();

		state = ST_WALKING;
		if (x > width/2) stWaDirRight = false;
		stWaChangeDirCount = (int) random(stWaChangeDirMinCount, stWaChangeDirMaxCount);

	}

	void process() {
		super.process();

		// check pine hit
		if(pine!= null) {
			if (pine.falling) {
				pine.destroy();
				pine = null;

				if(stCuPineBeingCut != null) {
					stCuPineBeingCut.rectCollider.addToColliderMask();
				}

				anim.setAnimation("walking");
				state = ST_FLEEING;

				pineHit();
			}
		}

		stateProcess();

	}

	void stateProcess() {

		if (state == ST_WALKING) {

			// Walk and Check bird direction
			if (stWaDirRight) {
				pos.x += stWaSpeed;
				if (pos.x > player.pos.x) {
					stWaChangeDirCount--;
					if (stWaChangeDirCount < 0) {
						stWaChangeDirection();
					}
				}
			} else {
				pos.x -= stWaSpeed;
				if (pos.x < player.pos.x) {
					stWaChangeDirCount--;
					if (stWaChangeDirCount < 0) {
						stWaChangeDirection();
					}
				}
			}

			// Check bird in range
			if(stWaCheckSight()) {
				anim.setAnimation("aiming");
				state = ST_AIMING;
				return;
			}

			// Check pine cut
			if(pine!= null) {
				if(!pine.falling) {
					anim.setAnimation("cutting_pine");
					pine.rectCollider.removeFromColliderMask();
					stCuPineBeingCut = pine;
					stCuCutCount = stCuCutMaxCount;
					state = ST_CUTTING_PINE;
					return;
				}
			}

		} else if (state == ST_CUTTING_PINE) {

			stCuCutCount--;
			if (stCuCutCount <= 0) {
				stCuPineBeingCut.destroy();
				stCuPineBeingCut = null;
				anim.setAnimation("walking");
				state = ST_WALKING;
				return;
			}

		} else if (state == ST_AIMING) {

			stAiCount--;
			if (stAiCount < 0) {
				stAiShot();
				soundManager.playSound("hunter_shot.wav");
				anim.setAnimation("shooting");
				state = ST_SHOOTING;
				return;
			}

		} else if (state == ST_SHOOTING) {

			stShRecoverCount--;
			if (stShRecoverCount < 0) {
				stShRecoverCount = stShRecoverMaxCount;
				if (pos.x > width/2) stWaDirRight = false;
				else stWaDirRight = true;
				stWaChangeDirCount = (int) random(stWaChangeDirMinCount, stWaChangeDirMaxCount);
				anim.setAnimation("walking");
				state = ST_WALKING;
				return;
			}

		}

	}

	void stWaChangeDirection() {
		stWaDirRight = !stWaDirRight;
		stWaChangeDirCount = (int) random(stWaChangeDirMinCount, stWaChangeDirMaxCount);
	}

	boolean stWaCheckSight() {
		if (sqDist(pos.x, pos.y, player.pos.x, player.pos.y) < sq(stWaSightRd)) {
			return true;
		}
		if (
			player.pos.x < pos.x + stWaVertSightX &&
			player.pos.x > pos.x - stWaVertSightX &&
			player.pos.y < pos.y + stWaVertSightY &&
			player.pos.y > pos.y - stWaVertSightY
			) {
			return true;
		}
		return false;
	}

	void stAiShot() {
		int x = (int) pos.x + 15;
		int y = (int) pos.y - 60;

		float xDist = player.pos.x - x;
    float yDist = player.pos.y - y;

    float hip = sqrt(sq(xDist) + sq(yDist));
    float multiplier = stSpeed / hip;
    float xSpeed = (multiplier * xDist);
    float ySpeed = (multiplier * yDist);

		globals.world.bullets.add(new Bullet(x, y, xSpeed, ySpeed));
		stAiCount = stAiMaxCount;
	}

	float sqDist(float x1, float y1, float x2, float y2) {
		return sq(x1-x2) + sq(y1-y2);
	}

	void debugDraw() {
		super.debugDraw();

		// sigth
		noStroke();
		fill(0, 30, 255, 30);
		ellipse(pos.x, pos.y, 2*stWaSightRd, 2*stWaSightRd);

		rect(pos.x, pos.y - stWaVertSightY/2, stWaVertSightX * 2, stWaVertSightY);

	}

}
