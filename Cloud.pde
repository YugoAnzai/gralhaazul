class Cloud extends GameObject{

	int rectW = 150;
	int rectH = 50;
	int colliderW = 100;
	int colliderH = 20;

	int speed;
	boolean goingRight = true;
	boolean hasWater = false;
	color c;
	int waterCounter;
	int maxWaterCounter;

	Cloud(int x, int y, int _speed, int _maxWaterCounter) {
		super(x, y, "Cloud");
		speed = _speed;
		maxWaterCounter = _maxWaterCounter;
		waterCounter = maxWaterCounter;
		rectCollider = new RectCollider(this, colliderManager.clouds, colliderW, colliderH);
	}

	void draw() {
		fill(c);
		rect(pos.x, pos.y, rectW, rectH);
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
			waterCounter = maxWaterCounter;
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
