class TestScene extends Scene{

	Animator anim;

	void setup() {
		anim = new Animator(100, 200, "img/cat.png", 10, 10);

		int[] animSprites = new int[]{0, 21};
		int[] animDuration = new int[]{15, 15};
		anim.createAnimation("idle", animSprites, animDuration);

		animSprites = new int[]{0, 3, 4};
		animDuration = new int[]{8, 8, 8};
		anim.createAnimation("walk", animSprites, animDuration);

		animSprites = new int[]{7, 8, 9, 10};
		animDuration = new int[]{3, 3, 3, 3};
		anim.createAnimation("kick", animSprites, animDuration);

		anim.setAnimation("idle");

		soundManager.playLoop("meet-the-princess.wav");

	}

	void process() {
		super.process();

		if (input.keyEnter.right) {
			anim.setAnimation("walk");
		}
		if (input.keyEnter.left) {
			anim.setAnimation("walk");
		}

		if (input.keyEnter.land) {
			soundManager.playSound("bomb.wav");
			anim.setAnimation("kick");
			anim.setNextAnimation("idle");
		}
		if (input.keyExit.right) {
			anim.setAnimation("idle");
		}
		if (input.keyExit.left) {
			anim.setAnimation("idle");
		}

		if (input.pressed.right){
			anim.x++;
		}
		if (input.pressed.left){
			anim.x--;
		}
		if (input.keyEnter.enter) {
			anim.pause();
		}
		if (input.keyEnter.grab) {
			anim.play();
		}

	}

	void draw(){
		background(0);

		anim.draw();

	}

	void debugDraw() {
		anim.debugDraw(200, 0);
	}

	void destroy(){
		super.destroy();
	}

}
