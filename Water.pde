class Water extends GameObject{

	int rectW = 100;
	int rectH = 20;
	int colliderW = 100;
	int colliderH = 20;
	RectCollider rectCollider;
	RectCollider[] collided;

	// x, y in the center of branch
	Water(int x, int y) {
		super(x, y, 0, "Water");
		rectCollider = new RectCollider(this, colliderManager.waters, colliderW, colliderH);
	}

	void draw() {
		fill(10, 113, 255);
		rect(pos.x, pos.y, rectW, rectH);
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

	void debugDraw(){
		rectCollider.debugDraw();
	}

}
