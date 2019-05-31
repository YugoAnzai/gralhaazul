class GameOverScene extends Scene{

	ArrayList<SelectibleText> texts = new ArrayList();

	Animator crow;

	void setup() {
		texts.add(new SelectibleText(100, 300, "Tentar Novamente"));
		texts.add(new SelectibleText(100, 400, "Ir Para o Mapa"));

		texts.get(0).selected = true;

		soundManager.playSound("loose");

		crow = new Animator(0, 0, "crow_cry.png", 1, 1);
		crow.createAnimation("idle", new int[]{0}, new int[]{99});
		crow.setAnimation("idle");

		crow.x = 680;
		crow.y = 480;

	}

	void process() {
		super.process();

		if (input.keyEnter.up || input.keyEnter.down) {

			soundManager.playSound("tick");

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
				soundManager.playSound("level_intro");
				sceneManager.changeScene("GameScene");
			} else if (index == 1) {
				soundManager.playSound("select");
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

		background(#5657b3);

		crow.draw();

		textSize(70);
		fill(0);
		text("Poxa, não foi desta vez", 100, 150);

		textSize(30);
		fill(0);
		text("Você perdeu todas as vidas ou ficou sem árvores nem pinhas.", 100, 200);

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
