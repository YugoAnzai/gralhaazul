class Enemy extends GameObject{

	int colliderW;
	int colliderH;
	RectCollider[] collided;

	boolean fleeing = false;
	int fleeingCounter = 100;
	int fleeSpeed = 6;

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
			fleeingCounter--;
			pos.x += fleeSpeed;
			if (fleeingCounter <= 0) {
				destroy();
			}
		}

	}

	void pineHit() {
		soundManager.playSound("pine_hit.wav");
		rectCollider.removeFromColliderMask();
		if (int(random(1.99)) == 0) fleeSpeed = -fleeSpeed;
		fleeing = true;
	}

	void destroy() {
		rectCollider.removeFromColliderMask();
		globals.world.enemiesDestroy.add(this);
	}

}
