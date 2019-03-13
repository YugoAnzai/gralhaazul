class World{

	ArrayList<Wall> walls = new ArrayList();
	ArrayList<Tree> trees = new ArrayList();
	Player player;

	World(Player _player){

		player = _player;

		// Walls

		// Trees
		trees.add(new Tree(500, 525, 3));
		trees.add(new Tree(300, 525, 3));
		trees.add(new Tree(300, 400, 2));
		trees.add(new Tree(300, 300, 2));
		trees.add(new Tree(700, 525, 3));
		trees.add(new Tree(700, 400, 2));

	}

	void draw(){
		background(20, 100, 80);

		for (Wall wall : walls){
			wall.draw();
		}
		for (Tree tree : trees){
			tree.draw();
		}
	}

	void debugDraw(int x, int y) {
		for (Wall wall : walls){
			wall.debugDraw();
		}
		for (Tree tree : trees){
			tree.debugDraw();
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
}
