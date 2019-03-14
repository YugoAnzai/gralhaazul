class ColliderManager{

	ColliderMask player;
	ColliderMask walls;
	ColliderMask trees;
	ColliderMask pines;

	ColliderManager(){

		player = new ColliderMask();
		walls = new ColliderMask();
		trees = new ColliderMask();
		pines = new ColliderMask();

		player.addCollidingMask(walls);
		player.addCollidingMask(trees);
		player.addCollidingMask(pines);

	}

}
