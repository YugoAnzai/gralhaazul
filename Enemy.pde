class Enemy extends GameObject{

	int colliderW;
	int colliderH;
	RectCollider[] collided;

	Enemy(int x, int y, String enemyName, int _colliderW, int _colliderH, int xOffset, int yOffset) {
		super(x, y, enemyName);
		colliderW = _colliderW;
		colliderH = _colliderH;
		rectCollider = new RectCollider(this, colliderManager.enemies, colliderW, colliderH, xOffset, yOffset);
	}

	void process() {

		collided = rectCollider.process();

		Pine pine = (Pine)globals.world.getGameObjectFromCollided(collided, "Pine");
		if(pine!= null) {
			pine.destroy();
			pine = null;
			pineHit();
		}

	}

	void pineHit() {
		println("pine hit");
		soundManager.playSound("pine_hit.wav");

	}

}
