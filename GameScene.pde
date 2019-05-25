class GameScene extends Scene{

	Player player;
	World world;
	EnemyManager enemyManager;

	int waterY = 300;
	int pineY = 500;
	int completeTrees = 0;
	String missionName = "Missão";

	Animator bg;

	void setup() {

	  player = new Player(width/2, globals.floorY, 600, 12, 3);
	  world = new World(player);

		soundManager.playLoop("forest");

		if (globals.level == 1) level1Setup();
		else if (globals.level == 2) level2Setup();
		else if (globals.level == 3) level3Setup();
		else if (globals.level == -1) tutorial1Setup();
		else if (globals.level == -2) tutorial2Setup();
		else if (globals.level == -3) tutorial3Setup();

	}

	void tutorial1Setup() {

		bg = new Animator(width/2, height/2, "background2.png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		missionName = "Treinamento 1";
		soundManager.playLoop("level2");

		// Clouds
		world.clouds.add(new Cloud(600, 50, 0.6, 550, 0));
		world.clouds.add(new Cloud(100, 125, 0.8, 700, 0));
		world.clouds.add(new Cloud(300, 200, 0.7, 400, 0));

		// Pine
		int pineX = 500;
		Pine pine = new Pine(pineX, pineY, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

		pineX = 200;
		pine = new Pine(pineX, pineY, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

		pineX = 800;
		pine = new Pine(pineX, pineY, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);

	}

	void tutorial2Setup() {

		bg = new Animator(width/2, height/2, "background2.png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		missionName = "Treinamento 2";
		soundManager.playLoop("level2");
		completeTrees = 1;

		// Clouds
		world.clouds.add(new Cloud(600, 50, 1, 500, 0));
		world.clouds.add(new Cloud(100, 125, 1, 500, 0));

		// Trees
		world.trees.add(new Tree(500, globals.floorY, 1));

	}

	void tutorial3Setup() {

		bg = new Animator(width/2, height/2, "background2.png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		missionName = "Treinamento 3";
		soundManager.playLoop("level2");

		// Trees
		Tree tree = new Tree(300, globals.floorY, 4);
		for (TreePart treePart : tree.treeParts) {
			treePart.pineGenCount = 1;
		}
		world.trees.add(tree);
		tree = new Tree(500, globals.floorY, 4);
		for (TreePart treePart : tree.treeParts) {
			treePart.pineGenCount = 1;
		}
		world.trees.add(tree);
		tree = new Tree(700, globals.floorY, 4);
		for (TreePart treePart : tree.treeParts) {
			treePart.pineGenCount = 1;
		}
		world.trees.add(tree);

		// Enemies
		world.enemies.add(new Hunter(-300, 1, 100, 150));
		world.enemies.add(new Hunter(-400, 0.8, 100, 150));
		world.enemies.add(new Hunter(1300, 0.9, 100, 150));

	}

	void level1Setup() {

		bg = new Animator(width/2, height/2, "background" + globals.level +".png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		missionName = "Missão 1";
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

		bg = new Animator(width/2, height/2, "background" + globals.level +".png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		missionName = "Missão 2";
		soundManager.playLoop("level2");
		completeTrees = 4;

		enemyManager = new EnemyManager(500, 1000, 60, 30);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 0.8, 800, 0));
		world.clouds.add(new Cloud(800, 100, 1, 600, 300));
		world.clouds.add(new Cloud(500, 150, 1.2, 900, 200));

		// Pine
		int pineX = 650;
		Pine pine = new Pine(pineX, pineY, null);
		pine.onTreePart = false;
		pine.falling = true;
		world.pines.add(pine);
		world.waters.add(new Water(pineX, waterY));

	}

	void level3Setup() {

		bg = new Animator(width/2, height/2, "background" + globals.level +".png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		missionName = "Missão 3";
		soundManager.playLoop("level3");
		completeTrees = 5;

		enemyManager = new EnemyManager(500, 1000, 55, 30);

		// Clouds
		world.clouds.add(new Cloud(100, 50, 1, 700, 100));
		world.clouds.add(new Cloud(700, 100, 1.3, 900, 0));
		world.clouds.add(new Cloud(500, 150, 1.2, 800, 200));

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
		if (enemyManager != null) enemyManager.process();

		if (globals.level == 1) level1CheckWin();
		else if (globals.level == 2) level2CheckWin();
		else if (globals.level == 3) level3CheckWin();
		else if (globals.level == -1) tutorial1CheckWin();
		else if (globals.level == -2) tutorial2CheckWin();
		else if (globals.level == -3) tutorial3CheckWin();

		checkFail();

	}

	void checkFail() {

		if (globals.world.trees.size() == 0 && globals.world.pines.size() == 0) {
			sceneManager.changeScene("GameOverScene");
		}

	}

	void tutorial1CheckWin() {
		if (globals.world.trees.size() >= 3) {
			sceneManager.changeScene("VictoryScene");
		}
	}

	void tutorial2CheckWin() {
		if (countFullTrees() >= completeTrees) {
			sceneManager.changeScene("VictoryScene");
		}
	}

	void tutorial3CheckWin() {
		if (world.enemies.size() == 0) {
			sceneManager.changeScene("VictoryScene");
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
		bg.draw();
	  world.draw();
	  player.draw();

		fill(0);
		textSize(25);
		text(missionName, 10, 20);

		String mission = "";
		if (globals.level == 1 || globals.level == 2 || globals.level == 3) {
			mission = "Plante árvores de 4 andares : " + countFullTrees() + " / " + completeTrees;
		} else if (globals.level == -1) {
			mission = "Molhe pinhas e brote árvores: " + globals.world.trees.size() + " / 3 árvores";
			fill(0);
			textSize(20);
			textAlign(CENTER);
			text("Mova com as setas e bata na nuvem com 'Espaço'.", width/2, 50);
			textAlign(LEFT);
		} else if (globals.level == -2) {
			mission = "Faça a árvore crescer até 4 andares.";
			fill(0);
			textSize(20);
			textAlign(CENTER);
			text("Molhe a árvore com a chuva.", width/2, 50);
			textAlign(LEFT);
		} else if (globals.level == -3) {
			mission = "Espante os caçadores: " + (3 - world.enemies.size()) + " / 3 caçadores";
			fill(0);
			textSize(20);
			textAlign(CENTER);
			text("Pegue pinhas com 'Espaço' e arremesse nos caçadores.", width/2, 50);
			textAlign(LEFT);
		}

		fill(0);
		textSize(25);
		textAlign(CENTER);
		text(mission, width/2, 20);
		textAlign(LEFT);

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
