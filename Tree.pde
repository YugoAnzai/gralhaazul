class Tree extends GameObject{

	int heightUnits;
	RectCollider rectCollider;
	ArrayList<TreePart> treeParts = new ArrayList();

	// x, y in the center base of the tree
	Tree(int x, int y, int _heightUnits) {
		super(x, y, 0, "Tree");
		heightUnits = _heightUnits;
		for (int i = 1; i < heightUnits + 1; i++) {
			treeParts.add(new TreePart((int)pos.x, (int)pos.y, i));
		}
	}

	void draw() {
		for (TreePart treePart : treeParts){
			treePart.draw();
		}
	}

	void debugDraw(){
		for (TreePart treePart : treeParts){
			treePart.rectCollider.debugDraw();
		}
	}

}
