class ColliderMask{

	ArrayList<Collider> colliders = new ArrayList();
	ArrayList<ColliderMask> collidingMasks = new ArrayList();

	ColliderMask(){

	}

	void addCollider(Collider collider) {
		colliders.add(collider);
	}

	void addCollidingMask(ColliderMask colliderMask){
		collidingMasks.add(colliderMask);
	}

}
