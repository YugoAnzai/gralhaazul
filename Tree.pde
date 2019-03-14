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
		for (int i = treeParts.size() -1 ; i >= 0; i--) {
			treeParts.get(i).draw();
		}
	}

	void debugDraw(){
		for (TreePart treePart : treeParts){
			treePart.rectCollider.debugDraw();
		}
	}

}
