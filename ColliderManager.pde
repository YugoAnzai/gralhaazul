class ColliderManager{

	ColliderMask player;
	ColliderMask walls;
	ColliderMask trees;
	ColliderMask pines;
	ColliderMask clouds;

	ColliderManager(){

		player = new ColliderMask();
		walls = new ColliderMask();
		trees = new ColliderMask();
		pines = new ColliderMask();
		clouds = new ColliderMask();

		player.addCollidingMask(walls);
		player.addCollidingMask(trees);
		player.addCollidingMask(pines);
		player.addCollidingMask(clouds);

	}

}
