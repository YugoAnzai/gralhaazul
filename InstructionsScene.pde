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
		text("Como jogar", 100, 100);
		textSize(20);
		fill(100, 200, 150);
		textSize(20);
		text("Seu Objetivo é plantar árvores até o quarto nível de altura", 100, 200);
		text("Use WASD ou as setas para mover o pássaro", 100, 270);
		text("Use Espaço para pegar a pinha e interagir com as nuvens", 100, 340);
		text("A água das nuvens faz a árvore crescer a a pinha brotar", 100, 410);
		text("Arremesse pinhas nos caçadores para espantá-los", 100, 480);
		text("Cuidado com a stamina! (barra verde), sem ela você não consegue voar", 100, 550);
		text("Boa sorte", 100, 620);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
