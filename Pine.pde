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

		anim = new Animator(0, 0, "pine.png", 1, 1);
		anim.createAnimation("idle", new int[]{0}, new int[]{99});
		anim.setAnimation("idle");

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
