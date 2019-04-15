class GameScene extends Scene{

	Player player;
	World world;
	EnemyManager enemyManager;

	void setup() {

	  player = new Player(width/2, globals.floorY, 700, 4, 4);
	  world = new World(player);

		soundManager.loadLoop("music", "music/fundo.wav", 0.1);
		soundManager.playLoop("music");

		if (globals.level == 1) level1Setup();
		else if (globals.level == 2) level2Setup();
		else if (globals.level == 3) level3Setup();

	}

	void level1Setup() {

		enemyManager = new EnemyManager(1000, 1500, 50);

		// Clouds
		world.clouds.add(new Cloud(600, 50, 0.6, 650, 0));
		world.clouds.add(new Cloud(100, 150, 0.8, 800, 0));

		// Pine
		Pine pine = new Pine(500, 500, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

	}

	void level2Setup() {

		enemyManager = new EnemyManager(300, 1300, 60);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 0.8, 800, 0));
		world.clouds.add(new Cloud(800, 100, 1, 600, 300));

		// Pine
		Pine pine = new Pine(650, 500, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

	}

	void level3Setup() {

		enemyManager = new EnemyManager(0, 1000, 200);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 1, 700, 100));
		world.clouds.add(new Cloud(500, 150, 1.3, 900, 100));

		// Pine
		Pine pine = new Pine(200, 500, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

	}

	void process() {

		super.process();
		world.process();
	  player.process();
		enemyManager.process();

		if (globals.level == 1) level1CheckWin();
		else if (globals.level == 2) level2CheckWin();
		else if (globals.level == 3) level3CheckWin();

	}

	void level1CheckWin() {

		if (world.trees.size() >= 1) {
			globals.level2locked = false;
			globals.selectedLevel = 2;
			sceneManager.changeScene("VictoryScene");
		}

	}

	void level2CheckWin() {

		if (world.trees.size() >= 5) {
			globals.level3locked = false;
			globals.selectedLevel = 3;
			sceneManager.changeScene("VictoryScene");
		}

	}

	void level3CheckWin() {

		if (world.trees.size() >= 6) {
			globals.selectedLevel = 1;
			globals.gameEnded = true;
			sceneManager.changeScene("EndScene");
		}

	}

	void draw(){
	  world.draw();
	  player.draw();

		fill(0);
		textSize(20);
		text("Level " + globals.level, 10, 20);

	}

	void debugDraw() {
		world.debugDraw(0, 150);
	  player.debugDraw(80, 0);
	  enemyManager.debugDraw(400, 0);
	}

	void destroy(){
		super.destroy();
		colliderManager.resetAllColliderMasks();
		soundManager.pauseLoop("music");
		soundManager.stopLoop("music");
		player = null;
		world = null;
	}

}
