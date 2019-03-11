class RectCollider extends Collider{

	int width;
	int height;

	RectCollider(GameObject _gameObject, ColliderMask _colliderMask, int _width, int _height){
		super(_gameObject, _colliderMask);
		width = _width;
		height = _height;
	}

	Collider process(){
		// update collider position
		pos.copyFromTransform(gameObject.pos);

		for (ColliderMask otherCollidingMask : colliderMask.collidingMasks) {
			for (Collider collider : otherCollidingMask.colliders){
				print(collider.gameObject.pos);
			}
		}

		// returning own collider for testing
		return this;

	}

	void debugDraw() {
		if (globals.drawColliders){
			stroke(255, 30, 0);
			fill(0, 255, 30, 80);
	    rect(int(pos.x), int(pos.y), width, height);
		}
	}

}
