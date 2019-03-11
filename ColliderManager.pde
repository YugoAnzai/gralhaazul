class ColliderManager{

	ColliderMask walls;
	ColliderMask player;

	ColliderManager(){
		
		walls = new ColliderMask();
		player = new ColliderMask();

		player.addCollidingMask(walls);

	}

	// mask1.addCollidingMask(mask2)
	// collider na máscara 1 enxerga colliders na máscara 2 para colisão


}
