class CircleCollider extends Collider{

	int radius;

	CircleCollider(GameObject _gameObject, Transform _pos, int _radius){
		super(_gameObject, _pos);
		radius = _radius;
	}

	void process(GameObject gameObject) {
		pos = gameObject.pos;
	}

	void debugDraw() {
		stroke(255, 30, 0);
		fill(0, 255, 30, 80);
    ellipse(int(pos.x), int(pos.y), radius * 2, radius * 2);
	}

}
