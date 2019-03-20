class GameScene extends Scene{

	Player player;
	World world;

	void setup() {

	  player = new Player(width/2, height/2, 300, 2, 3);
	  world = new World(player);

	}

	void process() {
		super.process();
		world.process();
	  player.process();
	}

	void draw(){
	  world.draw();
	  player.draw();
	}

	void debugDraw() {
		world.debugDraw(0, 150);
	  player.debugDraw(80, 0);
	}

	void destroy(){
		super.destroy();
		player = null;
		world = null;
	}

}
