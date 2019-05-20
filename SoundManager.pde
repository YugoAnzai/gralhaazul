import processing.sound.*;

class SoundManager{

	PApplet p;

	Minim minim;
	ArrayList<String> loopNames = new ArrayList();
	ArrayList<Boolean> loopPlaying = new ArrayList();
	ArrayList<AudioPlayer> loopSounds = new ArrayList();

	SoundManager(PApplet p) {
		minim = new Minim(p);
	}

	void playSound(String fileName) {
		AudioPlayer soundEffect = minim.loadFile("sound/sfx/" + fileName);
		soundEffect.play();
	}

	void loadLoop(String loopName, String fileName) {
		print("Loading loop: " + fileName);
		loopNames.add(loopName);
		loopPlaying.add(false);
		loopSounds.add(minim.loadFile("sound/" + fileName));
	}

	void unloadLoop(String loopName) {
		print("Unloading loop: " + fileName);
		int index = loopIndex(loopName);
		loopNames.remove(index);
		loopPlaying.remove(index);
		loopSounds.remove(index);
	}

	void pauseLoop(String loopName) {
		int index = loopIndex(loopName);
		if (loopPlaying.get(index)) {
			loopSounds.get(index).pause();
			loopPlaying.set(index, false);
		}
	}

	void playLoop(String loopName) {
		int index = loopIndex(loopName);
		if (!loopPlaying.get(index)) {
			loopSounds.get(index).loop();
			loopPlaying.set(index, true);
		}
	}

	int loopIndex(String loopName) {
		for (int i = 0; i < loopNames.size(); i++) {
			if (loopNames.get(i) == loopName) return i;
		}
		return -1;
	}

}
