class Water extends GameObject{

	int rectW = 100;
	int rectH = 20;
	int colliderW = 100;
	int colliderH = 20;
	RectCollider[] collided;

	// x, y in the center of branch
	Water(int x, int y) {
		super(x, y, "Water");
		rectCollider = new RectCollider(this, colliderManager.waters, colliderW, colliderH);

		anim = new Animator(0, 70, "water.png", 7, 1);

    int[] animSprites = new int[]{0, 1};
		int[] animDuration = new int[]{5, 5};
		anim.createAnimation("raining", animSprites, animDuration);

		animSprites = new int[]{1};
		animDuration = new int[]{99};
		anim.createAnimation("idle", animSprites, animDuration);

		anim.setAnimation("raining");
		anim.setNextAnimation("idle");
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
		globals.world.watersDestroy.add(this);
	}

}
