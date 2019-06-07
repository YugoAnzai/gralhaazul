class Pine extends GameObject implements IWaterable{

	int pineSize = 30;
	int colliderW = 27;
	int colliderH = 27;

	boolean falling = false;
	boolean onTreePart = true;
	TreePart fatherTreePart = null;

	Pine(int x, int y, TreePart treePart) {
		super(x, y, "Pine");
		fatherTreePart = treePart;
		rectCollider = new RectCollider(this, colliderManager.pines, colliderW, colliderH);

		anim = new Animator(0, 0, "pine.png", 2, 3);

		int[] animSprites = new int[]{0, 1, 2, 3, 4};
		int[] animDuration = new int[]{6, 6, 6, 6, 6};
		anim.createAnimation("growing", animSprites, animDuration);

		animSprites = new int[]{4, 5};
		animDuration = new int[]{24, 24};
		anim.createAnimation("idle", animSprites, animDuration);

		anim.setAnimation("growing");
		anim.setNextAnimation("idle");
    anim.play();

	}

	void pickup() {
		if (onTreePart) {
			onTreePart = false;
			fatherTreePart.generatedPine = null;
		}
	}

	void process() {

		if (falling) {
			pos.y += globals.fallSpeed;
			if (pos.y > (globals.floorY) - pineSize/2) {
        pos.y = globals.floorY - pineSize/2;
				falling = false;
				soundManager.playSound("pine_falling");
      }
		}

		rectCollider.process();

	}

	boolean water() {
		if (!falling && pos.y == globals.floorY - pineSize/2) {
			Tree tree = new Tree((int)pos.x, globals.floorY, 0);
			tree.grow();
			globals.world.trees.add(tree);
			destroy();
			return true;
		} else {
			return false;
		}
	}

	void destroy() {
		rectCollider.removeFromColliderMask();
		globals.world.pinesDestroy.add(this);
	}

}
