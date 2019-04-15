class GameScene extends Scene{

	Player player;
	World world;
	EnemyManager enemyManager;

	void setup() {

		colliderManager.resetAllColliderMasks();
		
	  player = new Player(width/2, height/2, 700, 4, 4);
	  world = new World(player);

		soundManager.loadLoop("music", "music/fundo.wav");
		soundManager.playLoop("music");

		if (globals.level == 1) level1Setup();
		else if (globals.level == 2) level2Setup();
		else if (globals.level == 3) level3Setup();


	}

	void level1Setup() {

		enemyManager = new EnemyManager(1000, 1500, 50);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 0.6, 650, 0));
		world.clouds.add(new Cloud(100, 150, 0.3, 800, 0));

		// Pine
		Pine pine = new Pine(500, 500, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

	}

	void level2Setup() {

		enemyManager = new EnemyManager(300, 1300, 60);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 0.8, 300, 100));
		world.clouds.add(new Cloud(800, 100, 1, 300, 100));

		// Pine
		Pine pine = new Pine(650, 500, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

	}

	void level3Setup() {

		enemyManager = new EnemyManager(0, 1000, 200);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 0.9, 800, 100));
		world.clouds.add(new Cloud(500, 150, 1.2, 900, 100));

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

		if (world.trees.size() >= 4) {
			globals.level2locked = false;
			sceneManager.changeScene("OverworldScene");
		}

	}

	void level2CheckWin() {

		if (world.trees.size() >= 5) {
			globals.level3locked = false;
			sceneManager.changeScene("OverworldScene");
		}

	}

	void level3CheckWin() {

		if (world.trees.size() >= 6) {
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
		soundManager.pauseLoop("music");
		soundManager.stopLoop("music");
		player = null;
		world = null;
	}

}
