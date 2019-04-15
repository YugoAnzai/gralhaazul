class TreePart extends GameObject implements IWaterable{

	int partHeight;
	int firstHeight = 150;
	int heightOffset = 100;
	int branchColliderW = 100;
	int branchColliderH = 20;

	Tree tree;
	int pineGenCount;
	int pineGenMaxCount;
	Pine generatedPine;

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
				return 800;
			case 2:
				return 1000;
			case 3:
				return 1200;
			default:
				return 1400;
		}
	}

	void process() {

		if(generatedPine == null) {
			pineGenCount--;
			if (pineGenCount <= 0) {
				generatedPine = new Pine((int)pos.x, (int)pos.y, this);
				globals.world.pines.add(generatedPine);
				pineGenCount = pineGenMaxCount;
			}
		}

	}

	boolean water() {
		return(tree.grow());
	}

	void destroy() {
		rectCollider.removeFromColliderMask();

		if (generatedPine != null) {
			generatedPine.falling = true;
			generatedPine.pickup();
		}

	}

}
