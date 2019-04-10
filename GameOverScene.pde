class GameOverScene extends Scene{

	ArrayList<SelectibleText> texts = new ArrayList();

	void setup() {
		texts.add(new SelectibleText(100, 300, "Tentar Novamente"));
		texts.add(new SelectibleText(100, 400, "Ir Para o Mapa"));

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
			if (index == 0) {
				sceneManager.changeScene("GameScene");
			} else if (index == 1) {
				sceneManager.changeScene("OverworldScene");
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
		text("Poxa, não foi desta vez", 100, 200);

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
