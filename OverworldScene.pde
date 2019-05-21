class OverworldScene extends Scene{

	Animator bg;
	Animator bird;
	ArrayList<OverworldLevel> levels = new ArrayList();

	float targetX;
	float targetY;
	float xSpeed;
	float ySpeed;
	float baseSpeed = 2;
	int tolerance = 5;
	boolean birdTravelling = false;

	void setup() {

		bg = new Animator(width/2, height/2, "overworld.png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		levels.add(new OverworldLevel(525, 200, "1 - Paraná", 0, false));
		levels.add(new OverworldLevel(620, 330, "2 - Santa Catarina", 0, globals.level2locked));
		levels.add(new OverworldLevel(450, 460, "3 - Rio Grande do Sul", 0, globals.level3locked));

		levels.get(globals.selectedLevel - 1).selected = true;

    bird = new Animator(0, 0, "overworldBird.png", 2, 1);
		bird.createAnimation("idle", new int[]{0,1}, new int[]{7,7});
		bird.setAnimation("idle");
		bird.play();
    bird.x = levels.get(globals.selectedLevel - 1).x;
    bird.y = levels.get(globals.selectedLevel - 1).y;
		targetX = bird.x;
		targetY = bird.y;
		birdTravelling = false;

		soundManager.pauseLoop("cutscene");
		soundManager.playLoop("menu");

	}

	void process() {
		super.process();

		if (birdTravelling) {
			bird.x += xSpeed;
			bird.y += ySpeed;

			if (
				targetX - tolerance < bird.x && bird.x < targetX + tolerance
				&&
				targetY - tolerance < bird.y && bird.y < targetY + tolerance
			) {
				birdTravelling = false;
			}

		}

		if (input.keyEnter.up || input.keyEnter.down) {

			soundManager.playSound("tick");

			int index = getSelectedIndex();
			levels.get(index).selected = false;

			if (input.keyEnter.down) {
				if (index < levels.size() - 1) {
					index++;
					if (levels.get(index).locked) {
						index--;
					}
				}
			} else if (input.keyEnter.up) {
				if (index > 0) index--;
			}

			levels.get(index).selected = true;

			setBirdTarget(levels.get(index).x, levels.get(index).y);

		}

		if (input.keyEnter.enter) {

			soundManager.playSound("level_intro");

			globals.level = getSelectedIndex() + 1;
			sceneManager.changeScene("GameScene");
			
		}

	}

	void setBirdTarget(int x, int y) {

		if (
			x - tolerance < bird.x && bird.x < x + tolerance
			&&
			y - tolerance < bird.y && bird.y < y + tolerance
		) return;

		targetX = x;
		targetY = y;

		float xDist = x - bird.x;
		float yDist = y - bird.y;

		float hip = sqrt(sq(xDist) + sq(yDist));
		float multiplier = baseSpeed / hip;
		xSpeed = (multiplier * xDist);
		ySpeed = (multiplier * yDist);

		birdTravelling = true;

	}

	int getSelectedIndex() {
		for (int i = 0; i < levels.size(); i++) {
			if (levels.get(i).selected) {
				return i;
			}
		}
		return 0;
	}

	void draw(){

		bg.draw();

		for (OverworldLevel level : levels){
			level.draw();
		}

		bird.draw();

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();

		soundManager.pauseLoop("menu");

	}

}
