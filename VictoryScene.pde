class VictoryScene extends Scene{

	String message = "";

	void setup() {

		soundManager.playSound("victory");

		if (globals.level >= 0) {
			message = "Parabéns! Missão " + globals.level + " completa";
		} else {
			message = "Parabéns Aprendiz! Treinamento " + (-globals.level) + " completo";
		}

	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {

			if (globals.level == -1 || globals.level == -2) {
				globals.level--;
				sceneManager.changeScene("GameScene");
			} else if (globals.level == -3 || globals.level > 0) {
				sceneManager.changeScene("OverworldScene");
			}

		}

	}

	void draw(){
		background(0);

		textSize(50);
		fill(0, 200, 150);
		textAlign(CENTER);
		text(message, width/2, height/2);
		textAlign(LEFT);

		fill(255);
		textSize(25);
		textAlign(CENTER);
		text("Aperte Espaço para Avançar", width/2, 650);
		textAlign(LEFT);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
