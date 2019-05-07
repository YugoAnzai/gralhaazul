class World{

	ArrayList<Wall> walls = new ArrayList();
	ArrayList<Tree> trees = new ArrayList();
	ArrayList<Pine> pines = new ArrayList();
	ArrayList<Cloud> clouds = new ArrayList();
	ArrayList<Water> waters = new ArrayList();
	ArrayList<Enemy> enemies = new ArrayList();
	ArrayList<Bullet> bullets = new ArrayList();
	Player player;

	ArrayList<Tree> treesDestroy = new ArrayList();
	ArrayList<Pine> pinesDestroy = new ArrayList();
	ArrayList<Water> watersDestroy = new ArrayList();
	ArrayList<Bullet> bulletsDestroy = new ArrayList();
	ArrayList<Enemy> enemiesDestroy = new ArrayList();

	Animator bg;

	World(Player _player){

		globals.world = this;

		bg = new Animator(width/2, height/2, "background" + globals.level +".png", 1, 1);
		bg.createAnimation("idle", new int[]{0}, new int[]{99});
		bg.setAnimation("idle");

		player = _player;

		enemies.add(new Hunter(10, 1.0, 80, 150));

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
		for (Enemy enemy : enemies){
			enemy.process();
		}
		for (Bullet bullet : bullets){
			bullet.process();
		}

		destroyProcess();

	}

	void destroyProcess() {
		for (Tree treeDestroy : treesDestroy) {
			trees.remove(treeDestroy);
		}
		treesDestroy.clear();
		for (Pine pineDestroy : pinesDestroy) {
			pines.remove(pineDestroy);
		}
		pinesDestroy.clear();
		for (Water waterDestroy : watersDestroy) {
			waters.remove(waterDestroy);
		}
		watersDestroy.clear();
		for (Bullet bulletDestroy : bulletsDestroy) {
			bullets.remove(bulletDestroy);
		}
		bulletsDestroy.clear();
		for (Enemy enemyDestroy : enemiesDestroy) {
			enemies.remove(enemyDestroy);
		}
		enemiesDestroy.clear();
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
		for (Enemy enemy : enemies){
			enemy.draw();
		}
		for (Bullet bullet : bullets){
			bullet.draw();
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
		for (Enemy enemy : enemies){
			enemy.debugDraw();
		}
		for (Bullet bullet : bullets){
			bullet.debugDraw();
		}

		debugDrawGrid();

	}

	void clear() {
		walls.clear();
		trees.clear();
		pines.clear();
		clouds.clear();
		waters.clear();
		enemies.clear();
		bullets.clear();

		player = null;

		treesDestroy.clear();
		pinesDestroy.clear();
		watersDestroy.clear();
		bulletsDestroy.clear();
		enemiesDestroy.clear();
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
