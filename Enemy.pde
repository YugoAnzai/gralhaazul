class Enemy extends GameObject{

	int colliderW;
	int colliderH;
	RectCollider rectCollider;
	RectCollider[] collided;

	Enemy(int x, int y, String enemyName, int _colliderW, int _colliderH) {
		super(x, y, enemyName);
		colliderW = _colliderW;
		colliderH = _colliderH;
		rectCollider = new RectCollider(this, colliderManager.enemies, colliderW, colliderH);
	}

}
