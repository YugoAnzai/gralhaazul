class EnemyManager{

	int leftX = -50;
	int rightX = 50;

	int baseSpawnTime;
	int rampUp;

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
		return "Hunter";
	}

	void createEnemy(String type) {
		int x = leftX;
		if (int(random(1.99)) == 0) x = rightX;

		if (type == "Hunter") globals.world.enemies.add(new Hunter(x));

		enemiesCreatedCount++;

		refreshCreateCount();

	}

	void refreshCreateCount() {
		enemyCreateCount = baseSpawnTime - (rampUp * (1/enemiesCreatedCount));
	}

	void debugDraw(int x, int y) {
		String[] lines = {
      "enCrdC:" + enemiesCreatedCount,
      "enCrC:" + enemyCreateCount,
    };
    debug.draw(lines, x, y, color(0, 0, 0), color(200, 10, 30));
	}

}
