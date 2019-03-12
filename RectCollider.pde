class RectCollider extends Collider{

	int width;
	int height;
	int xStart;
	int xEnd;
	int yStart;
	int yEnd;

	RectCollider(GameObject _gameObject, ColliderMask _colliderMask, int _width, int _height){
		super(_gameObject, _colliderMask);
		width = _width;
		height = _height;
		colliderMask.addCollider(this);
		posStartEndProcess();
	}

	void posStartEndProcess(){
		xStart = int(pos.x - width/2);
		xEnd = int(pos.x + width/2);
		yStart = int(pos.y - height/2);
		yEnd = int(pos.y + height/2);
	}

	RectCollider process(){

		pos.copyFromTransform(gameObject.pos);
		posStartEndProcess();

		for (ColliderMask otherCollidingMask : colliderMask.collidingMasks) {
			for (RectCollider collider : otherCollidingMask.colliders){
				if (checkCollisionRect(collider)) {
					collider.hit();
				}
			}
		}

		// returning own collider for testing
		return this;

	}

	boolean checkCollisionRect(RectCollider collider) {
		// println("xStart: " + xStart + "| xEnd: " + xEnd);
		// println("yStart: " + yStart + "| yEnd: " + yEnd);
		// println("collider.xStart: " + collider.xStart + "| collider.xEnd: " + collider.xEnd);
		// println("collider.yStart: " + collider.yStart + "| collider.yEnd: " + collider.yEnd);

		boolean xCollide = false;
		boolean yCollide = false;
		if (
				(xStart <= collider.xStart && collider.xStart <= xEnd) ||
				(xStart <= collider.xEnd && collider.xEnd <= xEnd) ||
				(collider.xStart <= xStart && xStart <= collider.xEnd) ||
				(collider.xStart <= xEnd && xEnd <= collider.xEnd)
			)
			xCollide = true;
		if (
				(yStart <= collider.yStart && collider.yStart <= yEnd) ||
				(yStart <= collider.yEnd && collider.yEnd <= yEnd) ||
				(collider.yStart <= yStart && yStart <= collider.yEnd) ||
				(collider.yStart <= yEnd && yEnd <= collider.yEnd)
			)
			yCollide = true;

		if (xCollide && yCollide) {
			return true;
		}

		return false;

	}

	void hit(){
		gameObject.hit();
	}

	void debugDraw() {
		if (globals.drawColliders){
			stroke(255, 30, 0);
			fill(0, 255, 30, 80);
	    rect(int(pos.x), int(pos.y), width, height);
		}
	}

}
