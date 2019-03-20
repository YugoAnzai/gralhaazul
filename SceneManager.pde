class SceneManager{

	Scene currentScene = null;

	SceneManager(String sceneName){
		currentScene = createScene(sceneName);
	}

	Scene createScene(String sceneName) {
		Scene scene = null;
		if(sceneName == "GameScene") scene = new GameScene();

		return scene;
	}

}
