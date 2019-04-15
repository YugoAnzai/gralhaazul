class EnemyManager{

	int leftX = -25;
	int rightX = 1025;

	int baseSpawnTime;
	int rampUp;
	int treesCountMultiplier = 100;
	int maxEnemyCountRampUp = 500;

	int enemiesCreatedCount = 0;
	int enemyCreateCount = 0;

	EnemyManager(int initialCount, int _baseSpawnTime, int _rampUp){
		enemyCreateCount = initialCount;
		baseSpawnTime = _baseSpawnTime;
		rampUp = _rampUp;
	}

	void process() {
		enemyCreateCount--;
		if (enemyCreateCount <= 0) {
			createEnemy(chooseType());
		}

	}

	String chooseType() {
		if (globals.world.trees.size() > 2) {
			if (enemiesCreatedCount > 3) {
				if (random(2) < 1) return "Lumberjack";
			}
		}
		return "Hunter";
	}

	void createEnemy(String type) {
		int x = leftX;
		if (random(2) < 1) x = rightX;

		if (type == "Hunter") globals.world.enemies.add(new Hunter(x));
		else if (type == "Lumberjack") globals.world.enemies.add(new Lumberjack(x));

		enemiesCreatedCount++;
		refreshCreateCount();

	}

	void refreshCreateCount() {
		enemyCreateCount = baseSpawnTime
		- (int)constrain((rampUp * (enemiesCreatedCount * 0.1)), 0, maxEnemyCountRampUp)
		- globals.world.trees.size() * treesCountMultiplier
		;
	}

	void debugDraw(int x, int y) {
		String[] lines = {
      "enCrdC:" + enemiesCreatedCount,
      "enCrC:" + enemyCreateCount,
			"trees:" + globals.world.trees.size(),
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));
	}

}
