class EndScene extends Scene{

	int index = 1;

	Animator cutscenes;

	void setup() {

		soundManager.playSound("victory");

		soundManager.playLoop("menu");

		globalTextBox.reset();
		globalTextBox.addLine("Após reflorestar os três Estados do Sul, a gralha se torna uma Lendária Gralha Azul.");
		globalTextBox.addLine("Com as florestas recuperadas, outro cientista descobre a fórmula do creme de cabelo, e cria um produto acessível a todos");
		globalTextBox.addLine("O Chefe dos Caçadores então desiste de seus planos malignos.");
		globalTextBox.addLine("Após o trabalho duro, a gralha pode finalmente descansar ao lado dos seus pais.");

		cutscenes = new Animator(0, 0, "cutscenes.png", 4, 2);
		cutscenes.createAnimation("6", new int[]{5}, new int[]{99});
		cutscenes.createAnimation("7", new int[]{6}, new int[]{99});
		cutscenes.createAnimation("8", new int[]{7}, new int[]{99});
		cutscenes.setAnimation("6");
		cutscenes.play();
		cutscenes.x = width/2;
		cutscenes.y = 275;

	}

	void process() {
		super.process();

		globalTextBox.process();

		if (input.keyEnter.enter || input.keyEnter.right) {
			if (!globalTextBox.finished) {

				index++;
				changeCutscene();

				globalTextBox.next();

			} else {
				sceneManager.changeScene("SplashScene");
			}
		}

	}

	void draw(){
		background(0);

		globalTextBox.draw();

		cutscenes.draw();

		if (globalTextBox.finished) {
			fill(255);
			textSize(25);
			textAlign(CENTER);
			text("Aperte Espaço para Avançar", width/2, 650);
			textAlign(LEFT);
		}

	}

	void changeCutscene() {
		switch(index) {
			case 2:
				cutscenes.setAnimation("7");
				break;
			case 4:
				cutscenes.setAnimation("8");
				break;
		}
	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();

		soundManager.pauseLoop("menu");

	}

}
