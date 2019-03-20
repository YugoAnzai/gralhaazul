class SelectibleText{

	String text;
	boolean selected = false;
	int x;
	int y;

	int selectionOffset = 50;

	// x, y in the center of branch
	SelectibleText(int _x, int _y, String _text) {
		x = _x;
		y = _y;
		text = _text;
	}

	void draw() {
		textSize(30);
		if(selected) {
			fill(250, 0, 0);
			rect(x - selectionOffset, y, 10, 10);
		} else {
			fill(0, 200, 150);
		}
		text(text, x, y);
	}

}
