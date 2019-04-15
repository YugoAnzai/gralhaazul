class CreditsScene extends Scene{

	void setup() {
	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("MenuScene");
		}

	}

	void draw(){
		background(0);

		textSize(50);
		fill(0, 150, 255);
		text("21205466 - Carlos Eduardo", 100, 100);
		text("20649004 - Daniela M Garcia", 100, 200);
		text("21114061 - Giovanni", 100, 300);
		text("20816627 - Sofia", 100, 400);
		text("21181866 - Yugo Anzai", 100, 500);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
