class TestScene extends Scene{

	void setup() {

		soundManager.playSound("hunter_hit.wav");

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
