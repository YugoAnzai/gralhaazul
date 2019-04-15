class EnemyManager{

	int leftX = -25;
	int rightX = 1025;

	int baseSpawnTime;
	int rampUp;
	int treesPartMultiplier = 30;
	int maxEnemyCountRampUp = 500;

	int enemiesCreated = 0;
	int enemyCreateCount = 0;

	EnemyManager(int initialCount, int _baseSpawnTime, int _rampUp){
		enemyCreateCount = initialCount;
		baseSpawnTime = _baseSpawnTime;
		rampUp = _rampUp;
	}

	void process() {
		enemyCreateCount--;
		if (enemyCreateCount <= 0) {
			createEnemy();
		}

	}

	void createEnemy() {

		globals.world.enemies.add(chooseTypeAndCreate());

		enemiesCreated++;
		refreshCreateCount();

	}

	Enemy chooseTypeAndCreate() {
		if (globals.world.trees.size() > 1) {
			if (enemiesCreated > 3) {
				if (random(2.3) < 1) return createLumberjack();
			}
		}
		return createHunter();
	}

	Hunter createHunter() {
		int x = leftX;
		if (random(2) < 1) x = rightX;

		float stWaSpeed = 1.2;
		int stAiMaxCount = 80;
		int stShRecoverMaxCount = 150;

		if (enemiesCreated > 7) stAiMaxCount = 60;
		if (enemiesCreated > 12) stShRecoverMaxCount = 80;
		if (enemiesCreated > 10) stWaSpeed = 1.4;
		if (enemiesCreated > 20) stAiMaxCount = 20;
		if (enemiesCreated > 25) stWaSpeed = 1.7;

		return new Hunter(x, stWaSpeed, stAiMaxCount, stShRecoverMaxCount);

	}

	Lumberjack createLumberjack() {
		int x = leftX;
		if (random(2) < 1) x = rightX;

		float stWaSpeed = 0.6;

		if (enemiesCreated > 10) stWaSpeed = 0.8;
		if (enemiesCreated > 20) stWaSpeed = 1.1;

		return new Lumberjack(x, stWaSpeed);

	}

	void refreshCreateCount() {
		enemyCreateCount = baseSpawnTime
		- (int)constrain((rampUp * (enemiesCreated * 0.5)), 0, maxEnemyCountRampUp)
		- countTreeParts() * treesPartMultiplier
		;
	}

	int countTreeParts() {
		int treeParts = 0;
		for (Tree tree : globals.world.trees){
			treeParts += tree.heightUnits;
		}
		return treeParts;
	}

	void debugDraw(int x, int y) {
		String[] lines = {
      "enCrtd:" + enemiesCreated,
      "enCrC:" + enemyCreateCount,
			"trees:" + globals.world.trees.size(),
			"trPrts:" + countTreeParts(),
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));
	}

}
