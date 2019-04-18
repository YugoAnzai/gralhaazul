class EnemyManager{

	int leftX = -25;
	int rightX = 1025;

	int baseSpawnTime;
	int rampUp;
	int maxEnemyCountRampUp = 400;
	int treesPartMultiplier;
	int maxTreePartRampUp = 300;

	int enemiesCreated = 0;
	int enemyCreateCount = 0;

	EnemyManager(int initialCount, int _baseSpawnTime, int _rampUp, int _treePartMultiplier){
		enemyCreateCount = initialCount;
		baseSpawnTime = _baseSpawnTime;
		rampUp = _rampUp;
		treesPartMultiplier = _treePartMultiplier;
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
			if (enemiesCreated > 4) {
				if (random(2.3) < 1) return createLumberjack();
			}
		}
		return createHunter();
	}

	Hunter createHunter() {
		int x = leftX;
		if (random(2) < 1) x = rightX;

		float stWaSpeed = 1.0;
		int stAiMaxCount = 80;
		int stShRecoverMaxCount = 150;

		if (enemiesCreated > 15) stWaSpeed = 1.2;
		if (enemiesCreated > 30) stWaSpeed = 1.4;
		if (enemiesCreated > 20) stAiMaxCount = 60;
		if (enemiesCreated > 40) stAiMaxCount = 50;
		if (enemiesCreated > 25) stShRecoverMaxCount = 130;
		if (enemiesCreated > 50) stShRecoverMaxCount = 110;

		return new Hunter(x, stWaSpeed, stAiMaxCount, stShRecoverMaxCount);

	}

	Lumberjack createLumberjack() {
		int x = leftX;
		if (random(2) < 1) x = rightX;

		float stWaSpeed = 0.6;

		if (enemiesCreated > 20) stWaSpeed = 0.8;
		if (enemiesCreated > 40) stWaSpeed = 0.9;
		if (enemiesCreated > 80) stWaSpeed = 1.3;

		return new Lumberjack(x, stWaSpeed);

	}

	void refreshCreateCount() {
		enemyCreateCount = baseSpawnTime
		- (int)constrain((rampUp * (enemiesCreated * 0.5)), 0, maxEnemyCountRampUp)
		- (int)constrain(countTreeParts() * treesPartMultiplier, 0, maxTreePartRampUp)
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
