class Animator{

	PImage spritesheet;
	PImage[] sprites;
	int w;
	int h;
	int x;
	int y;

	Animator(int _x, int _y, String fileName, int wImages, int hImages){

		x = _x;
		y = _y;
		spritesheet = loadImage(fileName);
		sprites = new PImage[wImages * hImages];
		w = spritesheet.width/wImages;
		h = spritesheet.height/hImages;

		for (int i = 0; i < sprites.length; i++) {
			int x = (i % wImages) * w;
			int y = (i / hImages) * h;
			sprites[i] = spritesheet.get(x, y, w, h);
		}

	}

	void draw(){
	  image(sprites[frameCount%sprites.length], x, y);
	}

	void debugDraw(int x, int y) {
		// String[] lines = {
		// 	"w: " + w,
		// 	"h: " + h,
		// };
		// debug.draw(lines, x, y);
	}


}
