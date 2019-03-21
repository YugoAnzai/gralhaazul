import processing.sound.*;

class SoundManager{

	PApplet p;
	SoundFile soundEffect;
	SoundFile loopSound;

	SoundManager(PApplet pApplet) {
		p = pApplet;
	}

	void playSound(String fileName) {
		soundEffect = new SoundFile(p, "sound/sfx/" + fileName);
		soundEffect.play();
	}

	void playLoop(String fileName) {
		loopSound = new SoundFile(p, "sound/music/" + fileName);
		loopSound.loop();
	}

	void stopLoop() {
		loopSound.pause();
	}

}
