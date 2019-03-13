class Tree extends GameObject{

	int heightUnits;
	int yBranchesOffset;
	RectCollider rectCollider;

	boolean playerHit;

	Tree(int x, int y, int _heightUnits) {
		super(x, y, 0, "Tree");
		heightUnits = _heightUnits;
		yBranchesOffset = - (heightUnits * 50)/2 + 25;
		rectCollider = new RectCollider(this, colliderManager.trees, 150, 50, 0, yBranchesOffset);
	}

	void draw() {
		if (playerHit) {
			fill(120, 200, 80);
		} else {
			fill(60, 200, 80);
		}
		rect(pos.x, pos.y + yBranchesOffset, 150, 50);
		fill(200, 30, 30);
		rect(pos.x, pos.y, 25, heightUnits * 50);
		playerHit = false;
	}

	void hit(){
		playerHit = true;
	}

	void debugDraw(){
		rectCollider.debugDraw();
	}

}
