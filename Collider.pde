abstract class Collider {

	Transform pos;
	GameObject gameObject;
	ColliderMask colliderMask;

	Collider(GameObject _gameObject, ColliderMask _colliderMask){
		gameObject = _gameObject;
		pos = new Transform(gameObject.pos.x, gameObject.pos.y, gameObject.pos.r);
		colliderMask = _colliderMask;
		_colliderMask.addCollider(this);
	}

	abstract Collider process();

	abstract void debugDraw();

}
