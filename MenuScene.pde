class MenuScene extends Scene{

	ArrayList<SelectibleText> texts = new ArrayList();

	void setup() {

		texts.add(new SelectibleText(100, 300, "Jogar"));
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
			if (index == 0) {
				if (!globals.sawCutscene) {
					sceneManager.changeScene("CutsceneScene");
				} else {
					sceneManager.changeScene("OverworldScene");
				}
			} else if (index == 1) {
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

		fill(255);
		textSize(25);
		textAlign(CENTER);
		text("Use as setas ou wasd para mover e Enter ou Espaço para selecionar", width/2, 650);
		textAlign(LEFT);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
