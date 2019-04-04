class GameScene extends Scene{

	Player player;
	World world;
	EnemyManager enemyManager;

	void setup() {

	  player = new Player(width/2, height/2, 500, 3, 3);
	  world = new World(player);
		enemyManager = new EnemyManager(500, 1300, 50);

		soundManager.loadLoop("music", "music/fundo.wav");
		soundManager.playLoop("music");

	}

	void process() {
		super.process();
		world.process();
	  player.process();
		enemyManager.process();
	}

	void draw(){
	  world.draw();
	  player.draw();
	}

	void debugDraw() {
		world.debugDraw(0, 150);
	  player.debugDraw(80, 0);
	  enemyManager.debugDraw(400, 0);
	}

	void destroy(){
		super.destroy();
		player = null;
		world = null;
	}

}
