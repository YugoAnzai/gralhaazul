class CircleCollider extends Collider{

	int radius;

	CircleCollider(GameObject _gameObject, ColliderMask _colliderMask, int _radius){
		super(_gameObject, _colliderMask);
		radius = _radius;
	}

	Collider process(){
		// returning own collider for testing
		return this;
	}

	void debugDraw() {
		if (globals.debug){
			stroke(255, 30, 0);
			fill(0, 255, 30, 80);
			ellipse(int(pos.x), int(pos.y), radius * 2, radius * 2);
		}
	}

}
