class ColliderMask{

	ArrayList<RectCollider> colliders = new ArrayList();
	ArrayList<ColliderMask> collidingMasks = new ArrayList();

	ColliderMask(){

	}

	void addCollider(RectCollider collider) {
		colliders.add(collider);
	}

	void addCollidingMask(ColliderMask colliderMask){
		collidingMasks.add(colliderMask);
	}

}
