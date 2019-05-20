class Tree extends GameObject{

	int heightUnits;
	int maxHeightUnits = 4;
	ArrayList<TreePart> treeParts = new ArrayList();

	// x, y in the center base of the tree
	Tree(int x, int y, int _heightUnits) {
		super(x, y, "Tree");
		heightUnits = _heightUnits;
		for (int i = 1; i < heightUnits + 1; i++) {
			treeParts.add(new TreePart((int)pos.x, (int)pos.y, i, this));
		}
	}

	void process() {

		for (TreePart treePart : treeParts){
			treePart.process();
		}

	}

	boolean grow() {
		if (heightUnits < maxHeightUnits) {
			heightUnits++;
			treeParts.add(new TreePart((int)pos.x, (int)pos.y, heightUnits, this));
			soundManager.playSound("tree_growing.mp3");
		}
		return true;
	}

	void draw() {
		for (int i = treeParts.size() -1 ; i >= 0; i--) {
			treeParts.get(i).draw();
		}
	}

	void debugDraw(){
		for (TreePart treePart : treeParts){
			treePart.rectCollider.debugDraw();
		}
	}

	void destroy() {
		for (int i = treeParts.size() -1 ; i >= 0; i--) {
			treeParts.get(i).destroy();
			treeParts.remove(i);
		}
		globals.world.treesDestroy.add(this);
	}

}
