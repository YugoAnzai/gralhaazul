class MenuScene extends Scene{

	ArrayList<SelectibleText> texts = new ArrayList();
	Animator logo;

	void setup() {

		texts.add(new SelectibleText(470, 500, "Jogar"));
		texts.add(new SelectibleText(470, 560, "Credits"));

		texts.get(0).selected = true;

		logo = new Animator(0, 0, "logo.png", 1, 1);
		logo.createAnimation("idle", new int[]{0}, new int[]{99});
		logo.setAnimation("idle");

	}

	void process() {
		super.process();

		if (input.keyEnter.up || input.keyEnter.down) {

			soundManager.playSound("tick.mp3");

			int index = getSelectedIndex();
			texts.get(index).selected = false;

			if (input.keyEnter.down) index++;
			else if (input.keyEnter.up) index--;

			if (index < 0) index += texts.size();
			else if (index >= texts.size()) index -= texts.size();

			texts.get(index).selected = true;

		}

		if (input.keyEnter.enter) {
			soundManager.playSound("select.mp3");
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

		logo.x = width/2;
		logo.y = 200;
		logo.draw();

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
