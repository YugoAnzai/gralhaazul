class SceneManager{

	Scene currentScene = null;
	Scene nextScene = null;

	SceneManager(String sceneName){
		currentScene = createScene(sceneName);
	}

	Scene createScene(String sceneName) {
		Scene scene = null;
		if(sceneName == "SplashScene") scene = new SplashScene();
		else if(sceneName == "GameScene") scene = new GameScene();

		return scene;
	}

	void changeScene(String sceneName) {
		nextScene = createScene(sceneName);
	}

	void process() {
		if (nextScene != null) {
			currentScene.destroy();
			currentScene = nextScene;
			nextScene = null;
		}
		currentScene.process();
	}

	void draw() {
		currentScene.draw();
	}

	void debugDraw() {
		currentScene.debugDraw();
	}

}
