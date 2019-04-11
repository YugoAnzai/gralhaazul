class EndScene extends Scene{

	void setup() {
	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("SplashScene");
		}

	}

	void draw(){
		background(0);

		textSize(70);
		fill(0, 200, 150);
		text("Fiiiiim", 100, height/2);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
