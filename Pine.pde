class Pine extends GameObject{

	int pineSize = 30;
	int colliderW = 20;
	int colliderH = 20;
	RectCollider rectCollider;

	boolean playerHit;

	// x, y in the center of branch
	Pine(int x, int y) {
		super(x, y, 0, "Pine");
		rectCollider = new RectCollider(this, colliderManager.pines, colliderW, colliderH);
	}

	void draw() {
		fill(204, 113, 44);
		rect(pos.x, pos.y, pineSize, pineSize);
	}

	void debugDraw(){
		rectCollider.debugDraw();
	}

}
