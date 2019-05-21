class GameScene extends Scene{

	Player player;
	World world;
	EnemyManager enemyManager;

	int waterY = 300;
	int pineY = 500;
	int completeTrees;

	void setup() {

	  player = new Player(width/2, globals.floorY, 600, 12, 3);
	  world = new World(player);

		soundManager.playLoop("forest");


		if (globals.level == 1) level1Setup();
		else if (globals.level == 2) level2Setup();
		else if (globals.level == 3) level3Setup();

	}

	void level1Setup() {

		soundManager.playLoop("level1");
		completeTrees = 3;

		enemyManager = new EnemyManager(800, 1200, 50, 20);

		// Clouds
		world.clouds.add(new Cloud(600, 50, 0.6, 550, 0));
		world.clouds.add(new Cloud(100, 150, 0.8, 700, 0));

		// Pine
		int pineX = 500;
		Pine pine = new Pine(pineX, pineY, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);
		world.waters.add(new Water(pineX, waterY));

	}

	void level2Setup() {

		soundManager.playLoop("level2");
		completeTrees = 4;

		enemyManager = new EnemyManager(500, 1000, 60, 30);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 0.8, 800, 0));
		world.clouds.add(new Cloud(800, 100, 1, 600, 300));

		// Pine
		int pineX = 650;
		Pine pine = new Pine(pineX, pineY, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);
		world.waters.add(new Water(pineX, waterY));

	}

	void level3Setup() {

		soundManager.playLoop("level3");
		completeTrees = 5;

		enemyManager = new EnemyManager(500, 1000, 55, 30);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 1, 700, 100));
		world.clouds.add(new Cloud(700, 125, 1.3, 900, 0));
		world.clouds.add(new Cloud(500, 200, 1.2, 800, 200));

		// Pine
		int pineX = 200;
		Pine pine = new Pine(pineX, pineY, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);
		world.waters.add(new Water(pineX, waterY));

	}

	void process() {

		super.process();
		world.process();
	  player.process();
		enemyManager.process();

		if (globals.level == 1) level1CheckWin();
		else if (globals.level == 2) level2CheckWin();
		else if (globals.level == 3) level3CheckWin();

		checkFail();

	}

	void checkFail() {

		if (globals.world.trees.size() == 0 && globals.world.pines.size() == 0) {
			sceneManager.changeScene("GameOverScene");
		}

	}

	void level1CheckWin() {

		if (countFullTrees() >= completeTrees) {
			globals.level2locked = false;
			globals.selectedLevel = 2;
			sceneManager.changeScene("VictoryScene");
		}

	}

	void level2CheckWin() {

		if (countFullTrees() >= completeTrees) {
			globals.level3locked = false;
			globals.selectedLevel = 3;
			sceneManager.changeScene("VictoryScene");
		}

	}

	void level3CheckWin() {

		if (countFullTrees() >= completeTrees) {
			globals.selectedLevel = 1;
			globals.gameEnded = true;
			sceneManager.changeScene("EndScene");
		}

	}

	int countFullTrees() {
		int fullTrees = 0;
		for (Tree tree : globals.world.trees){
			if (tree.heightUnits == tree.maxHeightUnits) fullTrees++;
		}
		return fullTrees;
	}

	void draw(){
	  world.draw();
	  player.draw();

		fill(0);
		textSize(25);
		text("Missão " + globals.level + " - ", 10, 20);

		String mission = "";
		if (globals.level == 1) {
			mission = level1StringMission();
		} else if (globals.level == 2) {
			mission = level2StringMission();
		} else if (globals.level == 3) {
			mission = level3StringMission();
		}
		fill(0);
		textSize(25);
		text(mission, 130, 20);

	}

	String level1StringMission() {
		return "Árvores de 4 andares completas: " + countFullTrees() + " / " + completeTrees;
	}

	String level2StringMission() {
		return "Árvores de 4 andares completas: " + countFullTrees() + " / " + completeTrees;
	}

	String level3StringMission() {
		return "Árvores de 4 andares completas: " + countFullTrees() + " / " + completeTrees;
	}

	void debugDraw() {
		world.debugDraw(0, 150);
	  player.debugDraw(80, 0);
	  enemyManager.debugDraw(400, 0);
	}

	void destroy(){
		super.destroy();
		colliderManager.resetAllColliderMasks();
		soundManager.pauseLoop("level1");
		soundManager.pauseLoop("level2");
		soundManager.pauseLoop("level3");
		soundManager.pauseLoop("forest");
		player.destroy();
		player = null;
		world.clear();
		world = null;
		enemyManager = null;
		System.gc();
	}

}
