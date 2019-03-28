import processing.sound.*;

class SoundManager{

	PApplet p;

	ArrayList<String> loopNames = new ArrayList();
	ArrayList<SoundFile> loopSounds = new ArrayList();

	SoundManager(PApplet pApplet) {
		p = pApplet;
	}

	void playSound(String fileName) {
		SoundFile soundEffect = new SoundFile(p, "sound/sfx/" + fileName);
		soundEffect.play();
	}

	void startLoop(String loopName, String fileName) {
		loopNames.add(loopName);
		SoundFile loop = new SoundFile(p, "sound/music/" + fileName);
		loopSounds.add(loop);
		loop.loop();
	}

	void stopLoop(String loopName) {
		int index = loopIndex(loopName);
		loopNames.remove(index);
		loopSounds.remove(index);
	}

	void pauseLoop(String loopName) {
		SoundFile loop = loopSounds.get(loopIndex(loopName));
		loop.pause();
	}

	void playLoop(String loopName) {
		SoundFile loop = loopSounds.get(loopIndex(loopName));
		loop.loop();
	}

	int loopIndex(String loopName) {
		for (int i = 0; i < loopNames.size(); i++) {
			if (loopNames.get(i) == loopName) return i;
		}
		return -1;
	}

}
