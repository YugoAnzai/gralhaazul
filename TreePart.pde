class TreePart extends GameObject implements IWaterable{

	int partHeight;
	int firstHeight = 150;
	int heightOffset = 100;
	int branchColliderW = 100;
	int branchColliderH = 20;
	RectCollider rectCollider;

	Tree tree;
	int pineGenCount;
	int pineGenMaxCount;
	boolean hasPine = false;

	// x, y in the center of branch
	TreePart(int treeX, int treeY, int _partHeight, Tree _tree) {
		super(treeX, treeY, 0, "TreePart");
		pos.y -= firstHeight - 25 + (_partHeight - 1) * heightOffset;
		partHeight = _partHeight;
		pineGenMaxCount = maxCountFromHeight();
		pineGenCount = pineGenMaxCount;
		tree = _tree;
		rectCollider = new RectCollider(this, colliderManager.trees, branchColliderW, branchColliderH);
	}

	int maxCountFromHeight() {
		switch(partHeight) {
			case 1:
				return 1000;
			case 2:
				return 2500;
			case 3:
				return 4000;
			default:
				return 5000;
		}
	}

	void process() {

		if(!hasPine) {
			pineGenCount--;
			if (pineGenCount <= 0) {
				hasPine = true;
				globals.world.pines.add(new Pine((int)pos.x, (int)pos.y, this));
				pineGenCount = pineGenMaxCount;
			}
		}

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
