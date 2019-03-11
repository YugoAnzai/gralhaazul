class Wall extends GameObject{

	int width;
	int height;
	RectCollider rectCollider;

	Wall(int x, int y, int _width, int _height) {
		super(x, y, 0);
		width = _width;
		height = _height;
		rectCollider = new RectCollider(this, pos, _width, _height);
	}

	void draw() {
		fill(0);
		rect(pos.x, pos.y, width, height);
	}

	void debugDraw(){
		rectCollider.debugDraw();
	}

}
