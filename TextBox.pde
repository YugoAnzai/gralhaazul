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
	int margin = 20;
	int textSize = 20;
	int initAlfa = 0;
	float alfa = initAlfa;
	float alfaJump = (float)(255 - initAlfa) / maxSkipCounter;

	// x and y on textBox center
	TextBox(int _x, int _y) {
		x = _x;
		y = _y;
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

			soundManager.playSound("tick.mp3");

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
		fill(100);
		rect(x, y, w, h);

		textSize(textSize);
		fill(255, (int)alfa);
		text(lines.get(index), x, y, w - 2* margin, h - 2* margin);

		if (canSkip) {
			fill(0, 255, 0);
			rect(x + w/2, y + h/2, 20 , 20);
		}

	}

}
