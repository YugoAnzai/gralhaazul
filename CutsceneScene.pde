class CutsceneScene extends Scene{

	int index = 1;
	int totalIndex = 4;
	int maxTimer = 200;
	int timer = maxTimer;

	Animator anim;

	void setup() {

		globals.sawCutscene = true;

		anim = new Animator(0, 0, "lumberjack.png", 2, 2);

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
		anim.createAnimation("swinging_player", animSprites, animDuration);
		animSprites = new int[]{1,2};
		animDuration = new int[]{2,2};
		anim.createAnimation("recovering", animSprites, animDuration);

		anim.setAnimation("walking");
    anim.play();

		anim.x = width/2;
		anim.y = height/2;

	}

	void process() {
		super.process();

		timer--;
		if (timer <= 0) {
			if (input.keyEnter.enter || input.keyEnter.right) {

				if (index == totalIndex) {
					sceneManager.changeScene("OverworldScene");
				}

				index++;
				timer = maxTimer;

				switch(index) {
					case 1:
						anim.setAnimation("cutting_pine");
						break;
					case 2:
						anim.setAnimation("aiming");
						break;
					case 3:
						anim.setAnimation("swinging_player");
						break;
					case 4:
						anim.setAnimation("recovering");
						break;
				}

			}
		}

	}

	void draw(){

		background(0);

		anim.draw();

		if (timer <= 0) {
			fill(255, 255, 255);
			textSize(20);
			text("Avançar (enter, espaço)", 700, 600);
		}

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
