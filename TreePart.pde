class TreePart extends GameObject implements IWaterable{

	int partHeight;
	int firstHeight = 150;
	int heightOffset = 100;
	int branchColliderW = 100;
	int branchColliderH = 20;
	RectCollider rectCollider;
	Tree tree;

	// x, y in the center of branch
	TreePart(int treeX, int treeY, int _partHeight, Tree _tree) {
		super(treeX, treeY, 0, "TreePart");
		pos.y -= firstHeight - 25 + (_partHeight - 1) * heightOffset;
		partHeight = _partHeight;
		tree = _tree;
		rectCollider = new RectCollider(this, colliderManager.trees, branchColliderW, branchColliderH);
	}

	void draw() {
		// wood
		int heightRef;
		if (partHeight == 1) {
			heightRef = firstHeight;
		} else {
			heightRef = heightOffset;
		}

		fill(200, 30, 30);
		rect(pos.x, pos.y + heightRef/2 - 25, 25, heightRef);

		// branch
		fill(30, 200, 30);
		rect(pos.x, pos.y, 150, 50);

	}

	boolean water() {
		return(tree.grow());
	}

	void debugDraw(){
		rectCollider.debugDraw();
	}

}
