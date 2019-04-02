class Bullet extends GameObject{

	int colliderW = 15;
	int colliderH = 15;
	RectCollider[] collided;

	Bullet(int x, int y, float xSpeed, float ySpeed) {
		super(x, y, "Bullet");
		speed.x = xSpeed;
		speed.y = ySpeed;

		anim = new Animator(0, 0, "bullet.png", 1, 1);
		anim.createAnimation("idle", new int[]{0}, new int[]{99});
		anim.setAnimation("idle");

		rectCollider = new RectCollider(this, colliderManager.bullets, colliderW, colliderH);
	}

	void process() {

		pos.x += speed.x;
		pos.y += speed.y;

		collided = rectCollider.process();

	}

	void destroy() {
		globals.world.bulletsDestroy.add(this);
	}

}
