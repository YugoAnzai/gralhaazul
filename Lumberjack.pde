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

	float stWaSpeed = 0.8;
	int stWaCutTreeDistance = 50;
	int stWaSight = 100;
	int stWaStepMaxCount = 70;
	int stWaStepCount = stWaStepMaxCount;

	int stCuCutMaxCount = 200;
	int stCuCutCount = stCuCutMaxCount;
	Pine stCuPineBeingCut;

	int stHiMaxCount = 200;
	int stHiCount = stHiMaxCount;
	Tree stHiTreeBeingCut;

	int stSwMaxCount = 40;
	int stSwCount = stSwMaxCount;
	int stSwYOffset = -70;
	int stSwRd = 100;

	int stReMaxCount = 150;
	int stReCount = stReMaxCount;

	Lumberjack(int x, float _stWaSpeed) {
		// hunter anchor is on the center of his feet
		super(x, globals.floorY, "Lumberjack", 40, 100, 0, -50);

		stWaSpeed = _stWaSpeed;

		anim = new Animator(0, -50, "lumberjack.png", 4, 3);

		player = globals.world.player;

    int[] animSprites = new int[]{0,1,2,3};
		int[] animDuration = new int[]{22,22,22,22};
		anim.createAnimation("walking", animSprites, animDuration);
		animSprites = new int[]{4,5,6};
		animDuration = new int[]{20,5,20};
		anim.createAnimation("cutting_tree", animSprites, animDuration);
		animSprites = new int[]{10,9};
		animDuration = new int[]{16,10};
		anim.createAnimation("cutting_pine", animSprites, animDuration);
		animSprites = new int[]{7};
		animDuration = new int[]{99};
		anim.createAnimation("aiming", animSprites, animDuration);
		animSprites = new int[]{8,9};
		animDuration = new int[]{20,20};
		anim.createAnimation("swinging_player", animSprites, animDuration);
		animSprites = new int[]{10};
		animDuration = new int[]{99};
		anim.createAnimation("recovering", animSprites, animDuration);
		animSprites = new int[]{11};
		animDuration = new int[]{12};
		anim.createAnimation("hit", animSprites, animDuration);
		animSprites = new int[]{0,1,2,3};
		animDuration = new int[]{5,5,5,5};
		anim.createAnimation("fleeing", animSprites, animDuration);

		anim.setAnimation("walking");
    anim.play();

		findNearestTree();

		state = ST_WALKING;
		if (x > width/2) {
			anim.flipped = true;
		}

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

				anim.setAnimation("hit");
				anim.setNextAnimation("fleeing");
				state = ST_FLEEING;

				pineHit();
			}
		}

		stateProcess();

	}

	void stateProcess() {

		if (state == ST_WALKING) {

			// Step sound
			stWaStepCount--;
			if (stWaStepCount <= 0) {
				playStepSound();
				stWaStepCount = stWaStepMaxCount;
			}

			if (nearestTree != null) {
				// Walk to nearest tree
				if (nearestTree.pos.x > pos.x) {
					pos.x += stWaSpeed;
					anim.flipped = false;
				} else {
					pos.x -= stWaSpeed;
					anim.flipped = true;
				}

				// Check near Tree;
				if (abs(nearestTree.pos.x - pos.x) < stWaCutTreeDistance) {
					anim.setAnimation("cutting_tree");
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
			if(checkPlayerdist(stWaSight, stSwYOffset)) {
				anim.setAnimation("aiming");
				state = ST_SWINGING_PLAYER;
				return;
			}

			// Check pine cut
			if(pine!= null) {
				if(!pine.falling) {
					anim.setAnimation("cutting_pine");
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
				anim.setAnimation("walking");
				state = ST_WALKING;
				return;
			}

		} else if (state == ST_HITTING_TREE) {

			stHiCount--;

			if (stHiCount <= 0) {
				soundManager.playSound("tree_falling.wav");
				anim.setAnimation("walking");
				findNearestTree();
				state = ST_WALKING;
				return;
			} else if (stHiCount <= 10 && stHiTreeBeingCut != null) {
				stHiTreeBeingCut.destroy();
				stHiTreeBeingCut = null;
			}

		} else if (state == ST_SWINGING_PLAYER) {

			stSwCount--;
			if (stSwCount <= 0) {
				
				anim.setAnimation("swinging_player");
				anim.setNextAnimation("recovering");

				// if player in range, hit
				if(checkPlayerdist(stSwRd, stSwYOffset)) {
					player.bulletHit();
				}
				stSwCount = stSwMaxCount;
				state = ST_RECOVERING;
				return;

			}

		} else if (state == ST_RECOVERING) {

			stReCount--;
			if (stReCount <= 0) {
				stReCount = stReMaxCount;
				anim.setAnimation("walking");
				state = ST_WALKING;
				return;
			}

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

	boolean checkPlayerdist(float dist, float yOffset) {
		if (sqDist(pos.x, pos.y + yOffset, player.pos.x, player.pos.y) < sq(dist)) {
			return true;
		}
		return false;
	}

	void draw() {
		super.draw();

	}

	void debugDraw() {
		super.debugDraw();

		// sigth
		noStroke();
		fill(0, 30, 255, 30);
		ellipse(pos.x, pos.y + stSwYOffset, 2*stWaSight, 2*stWaSight);

	}

}
