import processing.sound.*;

class SoundManager{

	PApplet p;

	ArrayList<String> loopNames = new ArrayList();
	ArrayList<Boolean> loopPlaying = new ArrayList();
	ArrayList<SoundFile> loopSounds = new ArrayList();

	SoundManager(PApplet pApplet) {
		p = pApplet;
	}

	void playSound(String fileName) {
		SoundFile soundEffect = new SoundFile(p, "sound/sfx/" + fileName);
		soundEffect.play();
	}

	void playSound(String fileName, float volume) {
		SoundFile soundEffect = new SoundFile(p, "sound/sfx/" + fileName);
		soundEffect.amp(volume);
		soundEffect.play();
	}

	void loadLoop(String loopName, String fileName) {
		loopNames.add(loopName);
		loopPlaying.add(false);
		loopSounds.add(new SoundFile(p, "sound/" + fileName));
	}

	void loadLoop(String loopName, String fileName, float volume) {
		loopNames.add(loopName);
		loopPlaying.add(false);
		SoundFile loop = new SoundFile(p, "sound/" + fileName);
		loop.amp(volume);
		loopSounds.add(loop);
	}

	void stopLoop(String loopName) {
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
