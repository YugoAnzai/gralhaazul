class VictoryScene extends Scene{

	void setup() {

		soundManager.playSound("victory.mp3");

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
		textAlign(CENTER);
		text("Parabéns! Missão " + globals.level + " completa", width/2, height/2);
		textAlign(LEFT);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
