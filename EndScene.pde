class EndScene extends Scene{

	void setup() {

		soundManager.playSound("victory.mp3");

		soundManager.loadLoop("overworld", "music/menu.mp3");
		soundManager.playLoop("overworld");

		globalTextBox.reset();
		globalTextBox.addLine("Após reflorestar os três Estados do Sul, a gralha se torna uma Lendária Gralha Azul.");
		globalTextBox.addLine("Com as florestas recuperadas, outro cientista bondoso descobre a fórmula do creme de cabelo, e cria um produto acesível a todos");
		globalTextBox.addLine("O chefe dos caçadores então desiste de seus planos malignos.");
		globalTextBox.addLine("Assim, após o trabalho duro, a gralha pode finalmente descansar ao lado dos seus pais.");

	}

	void process() {
		super.process();

		globalTextBox.process();

		if (input.keyEnter.enter || input.keyEnter.right) {
			if (!globalTextBox.finished) {
				globalTextBox.next();
			} else {
				sceneManager.changeScene("SplashScene");
			}
		}

	}

	void draw(){
		background(0);

		globalTextBox.draw();

		if (globalTextBox.finished) {
			fill(255);
			textSize(25);
			textAlign(CENTER);
			text("Espaço ou Enter para Avançar", width/2, 650);
			textAlign(LEFT);
		}

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();

		soundManager.pauseLoop("overworld");
		soundManager.unloadLoop("overworld");

	}

}
