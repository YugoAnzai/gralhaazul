class ColliderManager{

	ColliderMask player;
	ColliderMask walls;
	ColliderMask trees;

	ColliderManager(){

		player = new ColliderMask();
		walls = new ColliderMask();
		trees = new ColliderMask();

		player.addCollidingMask(walls);
		player.addCollidingMask(trees);

	}

}
