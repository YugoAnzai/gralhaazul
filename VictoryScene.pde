class VictoryScene extends Scene{

	String message = "";

	Animator crow;

	void setup() {

		soundManager.playSound("victory");

		if (globals.level >= 0) {
			message = "Parabéns! Missão " + globals.level + " completa";
		} else {
			message = "Parabéns Aprendiz! Treinamento " + (-globals.level) + " completo";
		}

		crow = new Animator(0, 0, "crow_fly.png", 1, 1);
		crow.createAnimation("idle", new int[]{0}, new int[]{99});
		crow.setAnimation("idle");

		crow.x = width/2;
		crow.y = 400;

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
		background(#5657b3);

		crow.draw();

		textSize(50);
		fill(0);
		textAlign(CENTER);
		text(message, width/2, 200);
		textAlign(LEFT);

		fill(0);
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
