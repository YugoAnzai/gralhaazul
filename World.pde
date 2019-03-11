class World{

	ArrayList<Wall> walls = new ArrayList();
	Player player;

	World(Player _player){

		player = _player;

		// Walls
		walls.add(new Wall(300, 100, 100, 50));
		walls.add(new Wall(0, 0, 20, height));
		walls.add(new Wall(0, 0, width, 20));
		walls.add(new Wall(0, height - 20, width, 20));
		walls.add(new Wall(width - 20, 0, 20, height));

	}

	void draw(){
		background(20, 200, 180);

		for (Wall wall : walls){
			wall.draw();
		}
	}

	void debugDraw(int x, int y) {
		for (Wall wall : walls){
			wall.debugDraw();
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
