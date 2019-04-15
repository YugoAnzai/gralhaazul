class VictoryScene extends Scene{

	void setup() {
	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("OverworldScene");
		}

	}

	void draw(){
		background(0);

		textSize(50);
		fill(0, 200, 150);
		text("Parabéns! Missão " + globals.level + " completa", 100, height/2);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
