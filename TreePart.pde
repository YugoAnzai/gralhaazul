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

	Animator fullTreeAnim;
	int fullTreeAnimOffset = - 50;

	// x, y in the center of branch
	TreePart(int treeX, int treeY, int _partHeight, Tree _tree) {
		super(treeX, treeY, "TreePart");
		pos.y -= firstHeight - 25 + (_partHeight - 1) * heightOffset;
		partHeight = _partHeight;
		pineGenMaxCount = maxCountFromHeight();
		pineGenCount = pineGenMaxCount;
		tree = _tree;
		rectCollider = new RectCollider(this, colliderManager.trees, branchColliderW, branchColliderH);

		anim = new Animator(0, 50, "tree.png", 5, 1);

    int[] animSprites = new int[]{3,4};
		int[] animDuration = new int[]{48,48};
		anim.createAnimation("idle", animSprites, animDuration);

		animSprites = new int[]{0, 1, 2};
		animDuration = new int[]{8, 10, 14};
		anim.createAnimation("growing", animSprites, animDuration);

		anim.setAnimation("idle");
    anim.play();

		fullTreeAnim = new Animator(0, 50, "treeGrew.png", 2, 3);
		fullTreeAnim.x = pos.x;
		fullTreeAnim.y = pos.y + fullTreeAnimOffset;

		animSprites = new int[]{0, 1, 2, 3, 4};
		animDuration = new int[]{3, 3, 3, 3, 3};
		fullTreeAnim.createAnimation("action", animSprites, animDuration);
		animSprites = new int[]{5};
		animDuration = new int[]{99};
		fullTreeAnim.createAnimation("idle", animSprites, animDuration);

		fullTreeAnim.setAnimation("idle");
		fullTreeAnim.play();

	}

	void growAnimation() {
		anim.setAnimation("growing");
		anim.setNextAnimation("idle");
		anim.play();
	}

	void fullGrowAnimation() {
		fullTreeAnim.setAnimation("action");
		fullTreeAnim.setNextAnimation("idle");
		fullTreeAnim.play();
	}

	void draw() {
		super.draw();
		fullTreeAnim.draw();
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
			generatedPine.destroy();
		}

	}

}
