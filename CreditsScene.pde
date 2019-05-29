class CreditsScene extends Scene{

	void setup() {
	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("MenuScene");
			soundManager.playSound("return");
		}

	}

	void draw(){
		background(0);

		textSize(30);
		fill(255);
		text("Feito Por:", 100, 100);

		int x = 240;
		textSize(40);
		fill(0, 150, 255);
		text("Carlos Belmiro", x, 150);
		text("Daniela Garcia", x, 250);
		text("Giovanni Raposo", x, 350);
		text("Sofia Defino", x, 450);
		text("Yugo Anzai", x, 550);

		x = 270;
		int y = 23;
		textSize(24);
		fill(0, 150, 255);
		text("Som", x, 150 + y);
		text("Arte", x, 250 + y);
		text("", x, 350 + y);
		text("Arte", x, 450 + y);
		text("Arte, Programação", x, 550 + y);

		x = 760;
		textSize(40);
		fill(0, 150, 255);
		textAlign(RIGHT);
		text("21205466", x, 150);
		text("20649004", x, 250);
		text("21114061", x, 350);
		text("20816627", x, 450);
		text("21181866", x, 550);
		textAlign(LEFT);

		fill(255);
		textSize(30);
		text("Aperte Espaço para voltar", 500, 650);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
