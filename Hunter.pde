class Hunter extends Enemy{

	// States
	final int ST_WALKING = 1;
	final int ST_CUTTING_PINE = 2;
	final int ST_AIMING = 3;
	final int ST_SHOOTING = 4;
	final int ST_HIT = 5;
	int state;

	Hunter(int x, int y) {
		super(x, y, "Hunter", 50, 100);

		anim = new Animator((int)pos.x, (int)pos.y, "hunter.png", 2, 2);

    int[] animSprites = new int[]{0};
		int[] animDuration = new int[]{99};
		anim.createAnimation("walking", animSprites, animDuration);
		animSprites = new int[]{1};
		animDuration = new int[]{99};
		anim.createAnimation("cutting_pine", animSprites, animDuration);
		animSprites = new int[]{2};
		animDuration = new int[]{99};
		anim.createAnimation("aiming", animSprites, animDuration);
		animSprites = new int[]{3};
		animDuration = new int[]{99};
		anim.createAnimation("shooting", animSprites, animDuration);
		animSprites = new int[]{1,2};
		animDuration = new int[]{2,2};
		anim.createAnimation("hit", animSprites, animDuration);

		anim.setAnimation("walking");
    anim.play();

	}

	void process() {

	}

	void draw() {
		anim.x = (int)pos.x;
    anim.y = (int)pos.y;
    anim.draw();
	}

}
