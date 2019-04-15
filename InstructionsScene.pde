class InstructionsScene extends Scene{

	void setup() {
		globals.sawInstructions = true;
	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("GameScene");
		}

	}

	void draw(){
		background(0);

		textSize(50);
		fill(0, 200, 150);
		text("Instruções", 100, 100);
		textSize(20);
		fill(100, 200, 150);
		text("Use WASD para mover o pássaro", 100, 200);
		text("Use Espaço para pousar em árvores", 100, 300);
		text("Use J para pegar pinha e interagir com nuvem", 100, 400);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
