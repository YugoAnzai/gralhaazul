class RectCollider extends Collider{

	int width;
	int height;

	RectCollider(GameObject _gameObject, ColliderMask _colliderMask, int _width, int _height){
		super(_gameObject, _colliderMask);
		width = _width;
		height = _height;
	}

	void debugDraw() {
		if (globals.drawColliders){
			stroke(255, 30, 0);
			fill(0, 255, 30, 80);
	    rect(int(pos.x), int(pos.y), width, height);
		}
	}

}
