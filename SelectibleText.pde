class SelectibleText{

	String text;
	boolean selected = false;
	int x;
	int y;

	int selectionXOffset = -20;
	int selectionYOffset = -5;

	Animator pine;

	// x, y in the center of branch
	SelectibleText(int _x, int _y, String _text) {
		x = _x;
		y = _y;
		text = _text;

		pine = new Animator(0, 0, "pineSelection.png", 1, 1);
		pine.createAnimation("idle", new int[]{0}, new int[]{99});
		pine.setAnimation("idle");

		pine.x = x + selectionXOffset;
		pine.y = y + selectionXOffset;

	}

	void draw() {
		textSize(30);
		if(selected) {
			fill(250, 0, 0);
			pine.draw();
		} else {
			fill(0, 200, 150);
		}
		text(text, x, y);
	}

}
