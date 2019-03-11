abstract class Collider {

	Transform pos;
	GameObject gameObject;

	Collider(GameObject _gameObject, Transform _pos){
		pos = _pos;
		gameObject = _gameObject;
	}

	void process(GameObject gameObject) {
		pos = gameObject.pos;
	}

	abstract void debugDraw();

}