class Pine extends GameObject implements IWaterable{

	int pineSize = 30;
	int colliderW = 20;
	int colliderH = 20;
	RectCollider rectCollider;

	boolean falling = false;
	boolean onTreePart = true;
	TreePart fatherTreePart = null;

	Pine(int x, int y, TreePart treePart) {
		super(x, y, 0, "Pine");
		fatherTreePart = treePart;
		rectCollider = new RectCollider(this, colliderManager.pines, colliderW, colliderH);
	}

	void draw() {
		fill(204, 113, 44);
		ellipse(pos.x, pos.y, pineSize, pineSize);
	}

	void pickup() {
		if (onTreePart) {
			onTreePart = false;
			fatherTreePart.hasPine = false;
		}
	}

	void process() {

		if (falling) {
			pos.y += globals.fallSpeed;
			if (pos.y > (globals.floorY) - pineSize/2) {
        pos.y = globals.floorY - pineSize/2;
				falling = false;
      }
		}

		rectCollider.process();

	}

	boolean water() {
		if (!falling && pos.y == globals.floorY - pineSize/2) {
			globals.world.trees.add(new Tree((int)pos.x, globals.floorY, 1));
			destroy();
			return true;
		} else {
			return false;
		}
	}

	void destroy() {
		globals.world.pinesDestroy.add(this);
	}

	void debugDraw(){
		rectCollider.debugDraw();
	}

}
