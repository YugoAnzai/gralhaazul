class Wall extends GameObject{

	int width;
	int height;

	boolean playerHit;

	Wall(int x, int y, int _width, int _height) {
		super(x, y, "Wall");
		width = _width;
		height = _height;
		rectCollider = new RectCollider(this, colliderManager.walls, _width, _height);
	}

	void draw() {
		if (playerHit) {
			fill(160, 80, 80);
		} else {
			fill(60, 30, 30);
		}
		rect(pos.x, pos.y, width, height);
		playerHit = false;
	}

	void hit(){
		playerHit = true;
	}

}
