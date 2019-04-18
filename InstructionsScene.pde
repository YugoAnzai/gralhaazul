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
		text("Use WASD ou as setas para mover o pássaro", 100, 200);
		text("Use Espaço para pinha e interagir com as nuvens", 100, 300);
		textSize(20);
		text("Plante árvores até o quarto nível usando a água das nuvens", 100, 500);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
