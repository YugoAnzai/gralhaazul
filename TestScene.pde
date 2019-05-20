class TestScene extends Scene{

	void setup() {

		soundManager.playSound("hunter_hit.mp3");

	}

	void process() {
		super.process();


	}

	void draw(){
		background(0);

	}

	void debugDraw() {

	}

	void destroy(){
		super.destroy();
	}

}
