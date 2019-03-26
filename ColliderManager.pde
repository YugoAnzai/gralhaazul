class ColliderManager{

	ColliderMask player;
	ColliderMask walls;
	ColliderMask trees;
	ColliderMask pines;
	ColliderMask clouds;
	ColliderMask waters;

	ColliderManager(){

		player = new ColliderMask();
		walls = new ColliderMask();
		trees = new ColliderMask();
		pines = new ColliderMask();
		clouds = new ColliderMask();
		waters = new ColliderMask();

		player.addCollidingMask(walls);
		player.addCollidingMask(trees);
		player.addCollidingMask(pines);
		player.addCollidingMask(clouds);

		waters.addCollidingMask(trees);
		waters.addCollidingMask(pines);

	}

}
