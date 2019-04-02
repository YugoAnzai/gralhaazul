class World{

	ArrayList<Wall> walls = new ArrayList();
	ArrayList<Tree> trees = new ArrayList();
	ArrayList<Pine> pines = new ArrayList();
	ArrayList<Cloud> clouds = new ArrayList();
	ArrayList<Water> waters = new ArrayList();
	Player player;

	ArrayList<Pine> pinesDestroy = new ArrayList();
	ArrayList<Water> watersDestroy = new ArrayList();

	Animator bg;

	World(Player _player){

		player = _player;

		// Clouds
		clouds.add(new Cloud(100, 50, 1, 800));
		clouds.add(new Cloud(500, 150, 2, 1000));

		// Trees
		trees.add(new Tree(500, globals.floorY, 1));

		bg = new Animator(width/2, height/2, "background1.png", 1, 1);

    int[] animSprites = new int[]{0};
		int[] animDuration = new int[]{99};
		bg.createAnimation("idle", animSprites, animDuration);

		bg.setAnimation("idle");
    bg.play();

	}

	void process() {
		for (Wall wall : walls){
			wall.process();
		}
		for (Tree tree : trees){
			tree.process();
		}
		for (Pine pine : pines){
			pine.process();
		}
		for (Cloud cloud : clouds){
			cloud.process();
		}
		for (Water water : waters){
			water.process();
		}

		destroyProcess();

	}

	void destroyProcess() {
		for (Water waterDestroy : watersDestroy) {
			waters.remove(waterDestroy);
		}
		watersDestroy = new ArrayList();
		for (Pine pineDestroy : pinesDestroy) {
			pines.remove(pineDestroy);
		}
		pinesDestroy = new ArrayList();
	}

	void draw(){
		bg.draw();

		for (Wall wall : walls){
			wall.draw();
		}
		for (Tree tree : trees){
			tree.draw();
		}
		for (Pine pine : pines){
			pine.draw();
		}
		for (Cloud cloud : clouds){
			cloud.draw();
		}
		for (Water water : waters){
			water.draw();
		}
	}

	void debugDraw(int x, int y) {
		for (Wall wall : walls){
			wall.debugDraw();
		}
		for (Tree tree : trees){
			tree.debugDraw();
		}
		for (Pine pine : pines){
			pine.debugDraw();
		}
		for (Cloud cloud : clouds){
			cloud.debugDraw();
		}
		for (Water water : waters){
			water.debugDraw();
		}

		debugDrawGrid();

	}

	void debugDrawGrid(){
		int interval = 50;
		stroke(0, 0, 255, 80);
		for (int x = 0; x < width; x += interval) {
			line(x, 0, x, height);
		}
		for (int y = 0; y < height; y += interval ){
			line(0, y, width, y);
		}
	}

	GameObject getGameObjectFromCollided(RectCollider[] collided, String name) {
		for (int i = 0; i < collided.length; i++){
			if (collided[i].gameObject.name == name){
				return collided[i].gameObject;
			}
		}
		return null;
	}

}
