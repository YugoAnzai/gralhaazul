class TreePart extends GameObject implements IWaterable{

	int partHeight;
	int firstHeight = 150;
	int heightOffset = 100;
	int branchColliderW = 100;
	int branchColliderH = 20;

	Tree tree;
	int pineGenCount;
	int pineGenMaxCount;
	boolean hasPine = false;

	// x, y in the center of branch
	TreePart(int treeX, int treeY, int _partHeight, Tree _tree) {
		super(treeX, treeY, "TreePart");
		pos.y -= firstHeight - 25 + (_partHeight - 1) * heightOffset;
		partHeight = _partHeight;
		pineGenMaxCount = maxCountFromHeight();
		pineGenCount = pineGenMaxCount;
		tree = _tree;
		rectCollider = new RectCollider(this, colliderManager.trees, branchColliderW, branchColliderH);

		anim = new Animator(0, 50, "tree.png", 1, 1);

    int[] animSprites = new int[]{0};
		int[] animDuration = new int[]{99};
		anim.createAnimation("idle", animSprites, animDuration);

		anim.setAnimation("idle");
    anim.play();

	}

	int maxCountFromHeight() {
		switch(partHeight) {
			case 1:
				return 1000;
			case 2:
				return 1200;
			case 3:
				return 1800;
			default:
				return 2500;
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

	boolean water() {
		return(tree.grow());
	}

}
