class SplashScene extends Scene{

	Animator logo;

	void setup() {

		soundManager.playLoop("cutscene");

		logo = new Animator(0, 0, "logo.png", 1, 1);
		int[] animSprites = new int[]{0};
		int[] animDuration = new int[]{99};
		logo.createAnimation("idle", animSprites, animDuration);

		logo.x = width/2;
		logo.y = height/2;

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

		logo.draw();

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
