class SplashScene extends Scene{

	void setup() {

		soundManager.playLoop("cutscene");

	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			soundManager.playSound("select");
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

		fill(255);
		textSize(25);
		textAlign(CENTER);
		text("Aperte Espaço", width/2, 650);
		textAlign(LEFT);

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
