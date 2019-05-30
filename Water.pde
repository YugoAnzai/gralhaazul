class Water extends GameObject{

	int rectW = 100;
	int rectH = 20;
	int colliderW = 120;
	int colliderH = 20;
	RectCollider[] collided;

	// x, y in the center of branch
	Water(int x, int y) {
		super(x, y, "Water");
		rectCollider = new RectCollider(this, colliderManager.waters, colliderW, colliderH);

		anim = new Animator(0, 0, "water.png", 1, 2);

    int[] animSprites = new int[]{0, 1};
		int[] animDuration = new int[]{24, 24};
		anim.createAnimation("idle", animSprites, animDuration);

		anim.setAnimation("idle");
    anim.play();

	}

	void process() {

		collided = rectCollider.process();

		for (int i = 0; i < collided.length; i++){
			IWaterable waterable = (IWaterable)collided[i].gameObject;
			if (waterable.water()) {
				destroy();
				return;
			}
		}

		pos.y += globals.fallSpeed;
		if (pos.y > (globals.floorY)) {
      destroy();
			pos.y = globals.floorY;
    }

	}

	void destroy() {
		rectCollider.removeFromColliderMask();
		globals.world.watersDestroy.add(this);
	}

}
