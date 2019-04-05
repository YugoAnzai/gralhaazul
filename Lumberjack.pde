class Lumberjack extends Enemy{

	// States
	final int ST_WALKING = 1;
	final int ST_CUTTING_PINE = 2;
	final int ST_FLEEING = 3;
	final int ST_HITTING_TREE = 4;
	final int ST_SWINGING_PLAYER = 5;
	final int ST_RECOVERING = 6;
	int state;

	Player player;

	Tree nearestTree;

	float stWaSpeed = 0.3;
	int stWaCutTreeDistance = 50;
	int stWaSight = 100;

	int stCuCutMaxCount = 150;
	int stCuCutCount = stCuCutMaxCount;
	Pine stCuPineBeingCut;

	int stHiMaxCount = 300;
	int stHiCount = stHiMaxCount;
	Tree stHiTreeBeingCut;

	int stSwMaxCount = 50;
	int stSwCount = stHiMaxCount;
	int stSwRd = 100;

	Lumberjack(int x) {
		// hunter anchor is on the center of his feet
		super(x, globals.floorY, "Lumberjack", 30, 80, 0, -50);

		anim = new Animator(0, -50, "lumberjack.png", 2, 2);

		player = globals.world.player;

    int[] animSprites = new int[]{0};
		int[] animDuration = new int[]{99};
		anim.createAnimation("walking", animSprites, animDuration);
		animSprites = new int[]{1};
		animDuration = new int[]{99};
		anim.createAnimation("cutting_pine", animSprites, animDuration);
		animSprites = new int[]{2};
		animDuration = new int[]{99};
		anim.createAnimation("aiming", animSprites, animDuration);
		animSprites = new int[]{3};
		animDuration = new int[]{99};
		anim.createAnimation("swinging_player", animSprites, animDuration);
		animSprites = new int[]{1,2};
		animDuration = new int[]{2,2};
		anim.createAnimation("recovering", animSprites, animDuration);

		anim.setAnimation("walking");
    anim.play();

		soundManager.loadLoop("hunter_walk", "sfx/hunter_walk.wav");
		soundManager.playLoop("hunter_walk");

		findNearestTree();

		state = ST_WALKING;

	}

	void process() {
		super.process();

		// check pine hit
		if(pine!= null) {
			if (pine.falling) {
				pine.destroy();
				pine = null;

				if(stCuPineBeingCut != null) {
					stCuPineBeingCut.rectCollider.addToColliderMask();
				}

				anim.setAnimation("walking");
				state = ST_FLEEING;

				pineHit();
			}
		}

		stateProcess();

	}

	void stateProcess() {

		if (state == ST_WALKING) {

			if (nearestTree != null) {
				// Walk to nearest tree
				if (nearestTree.pos.x > pos.x) {
					pos.x += stWaSpeed;
				} else {
					pos.x -= stWaSpeed;
				}

				// Check near Tree;
				if (abs(nearestTree.pos.x - pos.x) < stWaCutTreeDistance) {
					anim.setAnimation("cutting_pine");
					stHiTreeBeingCut = nearestTree;
					nearestTree = null;
					stHiCount = stHiMaxCount;
					state = ST_HITTING_TREE;
					return;
				}

			} else {
				findNearestTree();
			}

			// Check bird in range
			if(stWaCheckSight()) {
				anim.setAnimation("swinging_player");
				state = ST_SWINGING_PLAYER;
				return;
			}

			// Check pine cut
			if(pine!= null) {
				if(!pine.falling) {
					anim.setAnimation("cutting_pine");
					soundManager.pauseLoop("hunter_walk");
					pine.rectCollider.removeFromColliderMask();
					stCuPineBeingCut = pine;
					stCuCutCount = stCuCutMaxCount;
					state = ST_CUTTING_PINE;
					return;
				}
			}

		} else if (state == ST_CUTTING_PINE) {

			stCuCutCount--;
			if (stCuCutCount <= 0) {
				stCuPineBeingCut.destroy();
				stCuPineBeingCut = null;
				soundManager.playLoop("hunter_walk");
				anim.setAnimation("walking");
				state = ST_WALKING;
				return;
			}

		} else if (state == ST_HITTING_TREE) {

			stHiCount--;
			if (stHiCount <= 0) {
				stHiTreeBeingCut.destroy();
				stHiTreeBeingCut = null;
				soundManager.playSound("tree_falling.wav");
				anim.setAnimation("walking");
				findNearestTree();
				state = ST_WALKING;
				return;
			}

		} else if (state == ST_SWINGING_PLAYER) {

			// Implement

		}

	}

	void findNearestTree() {
		float dist = 1000;
		for (Tree tree : globals.world.trees){
			if(abs(tree.pos.x - pos.x) < dist) {
				dist = abs(tree.pos.x - pos.x);
				nearestTree = tree;
			}
		}
	}

	float sqDist(float x1, float y1, float x2, float y2) {
		return sq(x1-x2) + sq(y1-y2);
	}

	boolean stWaCheckSight() {
		if (sqDist(pos.x, pos.y, player.pos.x, player.pos.y) < sq(stWaSight)) {
			return true;
		}
		return false;
	}

	void debugDraw() {
		super.debugDraw();

		// sigth
		noStroke();
		fill(0, 30, 255, 30);
		ellipse(pos.x, pos.y, 2*stWaSight, 2*stWaSight);

	}

}
