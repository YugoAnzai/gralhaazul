class RectCollider extends Collider{

	int width;
	int height;

	RectCollider(GameObject _gameObject, Transform _pos, int _width, int _height){
		super(_gameObject, _pos);
		width = _width;
		height = _height;
	}

	void process(GameObject gameObject) {
		pos = gameObject.pos;
	}

	void debugDraw() {
		stroke(255, 30, 0);
		fill(0, 255, 30, 80);
    	rect(int(pos.x), int(pos.y), width, height);
	}

}