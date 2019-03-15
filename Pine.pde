class Pine extends GameObject{

	int pineSize = 30;
	int colliderW = 20;
	int colliderH = 20;
	boolean falling = false;
	RectCollider rectCollider;

	// x, y in the center of branch
	Pine(int x, int y) {
		super(x, y, 0, "Pine");
		rectCollider = new RectCollider(this, colliderManager.pines, colliderW, colliderH);
	}

	void draw() {
		fill(204, 113, 44);
		ellipse(pos.x, pos.y, pineSize, pineSize);
	}

	void process() {

		rectCollider.process();

		if (falling) {
			pos.y += globals.fallSpeed;
			if (pos.y > (globals.floorY) - pineSize/2) {
        pos.y = globals.floorY - pineSize/2;
				falling = false;
      }
		}

	}

	void debugDraw(){
		rectCollider.debugDraw();
	}

}
