class Enemy extends GameObject{

	int colliderW;
	int colliderH;
	RectCollider[] collided;

	boolean fleeing = false;
	int fleeSpeed = 6;
	int fleeShoutCount = 10;
	boolean fleeShoutDone = false;

	Pine pine;

	Enemy(int x, int y, String enemyName, int _colliderW, int _colliderH, int xOffset, int yOffset) {
		super(x, y, enemyName);
		colliderW = _colliderW;
		colliderH = _colliderH;
		rectCollider = new RectCollider(this, colliderManager.enemies, colliderW, colliderH, xOffset, yOffset);
	}

	void process() {

		collided = rectCollider.process();

		pine = (Pine)globals.world.getGameObjectFromCollided(collided, "Pine");

		if (fleeing) {

			if (!fleeShoutDone) {
				fleeShoutCount--;
				if (fleeShoutCount < 0) {
					soundManager.playSound("hunter_hit.wav");
					fleeShoutDone = true;
				}
			}

			pos.x += fleeSpeed;
			if (pos.x < -25 || pos.x > width + 25) {
				destroy();
			}
		}

	}

	void pineHit() {
		soundManager.playSound("pine_hit.wav", 0.4);
		rectCollider.removeFromColliderMask();
		if (random(2) < 1) fleeSpeed = -fleeSpeed;
		fleeing = true;
	}

	void destroy() {
		rectCollider.removeFromColliderMask();
		globals.world.enemiesDestroy.add(this);
	}

	void playStepSound() {
		float volume = 0.3;
		float random = random(4);
		if (random < 1) {
			soundManager.playSound("hunter_walk_1.wav", volume);
		} else if (random < 2) {
			soundManager.playSound("hunter_walk_2.wav", volume);
		} else if (random < 3) {
			soundManager.playSound("hunter_walk_3.wav", volume);
		} else if (random < 4) {
			soundManager.playSound("hunter_walk_4.wav", volume);
		}
	}

}
