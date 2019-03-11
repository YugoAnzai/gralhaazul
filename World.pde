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
	}
}