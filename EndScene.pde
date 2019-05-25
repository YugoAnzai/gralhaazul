class EndScene extends Scene{

	void setup() {

		soundManager.playSound("victory");

		soundManager.playLoop("menu");

		globalTextBox.reset();
		globalTextBox.addLine("Após reflorestar os três Estados do Sul, a gralha se torna uma Lendária Gralha Azul.");
		globalTextBox.addLine("Com as florestas recuperadas, outro cientista descobre a fórmula do creme de cabelo, e cria um produto acessível a todos");
		globalTextBox.addLine("O Chefe dos Caçadores então desiste de seus planos malignos.");
		globalTextBox.addLine("Após o trabalho duro, a gralha pode finalmente descansar ao lado dos seus pais.");

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
			text("Aperte Espaço para Avançar", width/2, 650);
			textAlign(LEFT);
		}

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();

		soundManager.pauseLoop("menu");

	}

}
