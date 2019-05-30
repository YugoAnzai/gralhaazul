class TextBox{

	ArrayList<String> lines = new ArrayList();
	int index = 0;

	int maxSkipCounter = 50;
	int skipCounter = maxSkipCounter;
	boolean canSkip = false;
	boolean finished = false;

	int x;
	int y;

	int w = 800;
	int h = 150;
	int xMargin = 30;
	int yMargin = 15;
	int textSize = 20;
	int initAlfa = 0;
	float alfa = initAlfa;
	float alfaJump = (float)(255 - initAlfa) / maxSkipCounter;

	Animator textbox;
	Animator arrow;

	// x and y on textBox center
	TextBox(int _x, int _y) {
		x = _x;
		y = _y;

		textbox = new Animator(0, 0, "textbox.png", 1, 1);
		textbox.createAnimation("idle", new int[]{0}, new int[]{99});
    textbox.setAnimation("idle");
		textbox.x = x;
		textbox.y = y;

		arrow = new Animator(0, 0, "arrow.png", 1, 1);
		arrow.createAnimation("idle", new int[]{0}, new int[]{99});
    arrow.setAnimation("idle");
		arrow.x = x + 360;
		arrow.y = y + 40;

	}

	void process() {
		skipCounter--;
		alfa += alfaJump;
		if (skipCounter < 0) {
			alfa = 255;
			canSkip = true;
		}
	}

	void next() {
		if (canSkip) {

			soundManager.playSound("tick");

			if (index >= lines.size() - 1) {
				finished = true;
			} else {
				skipCounter = maxSkipCounter;
				canSkip = false;
				alfa = initAlfa;
				index ++;
			}
		}
	}

	void addLine(String str) {
		lines.add(str);
	}

	void reset() {
		lines.clear();
		index = 0;
		finished = false;
	}

	void draw() {

		// fill(100);
		// rect(x, y, w, h);
		textbox.draw();

		textSize(textSize);
		fill(255, (int)alfa);
		text(lines.get(index), x, y, w - 2* xMargin, h - 2* yMargin);

		if (canSkip) {
			arrow.draw();
		}

	}

}
