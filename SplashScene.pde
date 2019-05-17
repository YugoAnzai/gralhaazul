class SplashScene extends Scene{

	void setup() {

		soundManager.loadLoop("menu", "music/menu.mp3");
		soundManager.playLoop("menu");

	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("MenuScene");
		}

	}

	void draw(){

		background(0);

		textSize(70);
		fill(0, 200, 150);
		textAlign(CENTER);
		text("GGGralha Team", width/2, height/2);
		textAlign(LEFT);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
