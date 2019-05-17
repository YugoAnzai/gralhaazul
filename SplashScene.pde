class SplashScene extends Scene{

	void setup() {
	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("MenuScene");
		}

		soundManager.loadLoop("menu", "music/menu.mp3", 0.1);
		soundManager.playLoop("menu");

	}

	void draw(){
		background(0);

		textSize(70);
		fill(0, 200, 150);
		text("GGGralha Team", 100, height/2);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
