class Cloud extends GameObject{

	int rectW = 150;
	int rectH = 50;
	int colliderW = 120;
	int colliderH = 100;

	float speed;
	boolean goingRight = true;
	boolean hasWater = false;
	color c;
	int waterCounter;
	int maxWaterCounter;

	Cloud(int x, int y, float _speed, int _maxWaterCounter, int _waterCounter) {
		super(x, y, "Cloud");
		speed = _speed;
		maxWaterCounter = _maxWaterCounter;
		waterCounter = _waterCounter;
		rectCollider = new RectCollider(this, colliderManager.clouds, colliderW, colliderH);

		anim = new Animator(0, 0, "cloud.png", 1, 3);
		anim.createAnimation("idle", new int[]{0,1,2,1}, new int[]{36,36,36,36});
		anim.setAnimation("idle");
		anim.play();

	}

	void draw() {
		tint(c);
		super.draw();
		tint(255);
	}

	void process() {

		// water counter
		if (!hasWater) {
			waterCounter--;
			c = color(counterToGreyScale(waterCounter, maxWaterCounter));
			if (waterCounter < 0) {
				hasWater = true;
				c = color(80, 100, 255);
			}
		}

		// movement
		if (goingRight) {
			pos.x += speed;
			if (pos.x > width - rectW/2) {
        goingRight = false;
      }
		} else {
			pos.x -= speed;
			if (pos.x < 0 + rectW/2) {
				goingRight = true;
			}
		}

		rectCollider.process();

	}

	void interact() {
		if (hasWater) {
			hasWater = false;
			if (globals.cheat) {
				waterCounter = 0;
			} else {
				waterCounter = maxWaterCounter;
			}
			globals.world.waters.add(new Water((int)pos.x, (int)pos.y));
		}
	}

	int counterToGreyScale(int count, int maxCount) {

		int minColor = 230;
		int maxColor = 100;

		float rate = (float)(maxCount - count)/maxCount;
		return (minColor - (int)((minColor - maxColor) * rate));

	}

}
