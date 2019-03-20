class TestScene extends Scene{

	Animator anim;

	void setup() {
		anim = new Animator(100, 200, "cat.png", 10, 10);
	}

	void process() {
		super.process();

		if (input.keyEnter.enter) {
			sceneManager.changeScene("MenuScene");
		}

	}

	void draw(){
		background(0);

		// textSize(70);
		// fill(0, 200, 150);
		// text("GGGralha Team", 100, height/2);

		anim.draw();

	}

	void debugDraw() {
		anim.debugDraw(200, 0);
	}

	void destroy(){
		super.destroy();
	}

}
