class MenuScene extends Scene{

	ArrayList<SelectibleText> texts = new ArrayList();

	void setup() {
		texts.add(new SelectibleText(100, 300, "Play Game"));
		texts.add(new SelectibleText(100, 400, "Credits"));

		texts.get(0).selected = true;
	}

	void process() {
		super.process();

		if (input.keyEnter.up || input.keyEnter.down) {
			int index = getSelectedIndex();
			texts.get(index).selected = false;

			if (input.keyEnter.down) index++;
			else if (input.keyEnter.up) index--;

			if (index < 0) index += texts.size();
			else if (index >= texts.size()) index -= texts.size();

			texts.get(index).selected = true;

		}

		if (input.keyEnter.enter) {
			int index = getSelectedIndex();
			if (texts.get(index).text == "Play Game") {
				sceneManager.changeScene("GameScene");
			} else if (texts.get(index).text == "Credits") {
				sceneManager.changeScene("CreditsScene");
			}
		}


	}

	int getSelectedIndex() {
		for (int i = 0; i < texts.size(); i++) {
			if (texts.get(i).selected) {
				return i;
			}
		}
		return 0;
	}

	void draw(){

		background(0);

		textSize(70);
		fill(0, 150, 255);
		text("Gralha Azul", 100, 200);

		for (SelectibleText text : texts){
			text.draw();
		}

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
