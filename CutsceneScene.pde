class CutsceneScene extends Scene{

	int index = 1;

	Animator cutscenes;

	void setup() {

		globals.sawCutscene = true;

		globalTextBox.reset();
		globalTextBox.addLine("Muito tempo atrás, um casal de gralhas plantou as florestas de araucárias do Sul do Brasil. Por muito tempo continuaram protegendo as florestas e se tornaram lendárias Gralhas Azuis.");
		globalTextBox.addLine("Com as florestas recuperadas. O Casal passou a viver suas vidas normalmente e tiveram um filhote, que cresceu forte e feliz.");
		globalTextBox.addLine("Porém, enquanto isso, o vaidoso Chefe dos Caçadores descobriu uma forma de fazer um creme para cabelos fenomenal, a partir das pinhas de araucária");
		globalTextBox.addLine("Ele então ordenou que seus lenhadores cortassem todas as araucárias do Brasil.");
		globalTextBox.addLine("Com as pinhas em mãos, ordenou também que caçadores vigiassem as florestas para que as araucárias não fossem plantadas novamente, garantindo que ninguém mais descobrisse a fórmula.");
		globalTextBox.addLine("O filhote é então escolhido para uma grande missão: replantar as florestas de araucárias.");
		globalTextBox.addLine("Ele é treinado e recebe uma última pinha, que estava escondida e protegida pelos pais.");
		globalTextBox.addLine("Levando a última esperança das florestas, a gralha começa então sua jornada pelo Sul do Brasil.");

		cutscenes = new Animator(0, 0, "cutscenes.png", 4, 2);
		cutscenes.createAnimation("1", new int[]{0}, new int[]{99});
		cutscenes.createAnimation("2", new int[]{1}, new int[]{99});
		cutscenes.createAnimation("3", new int[]{2}, new int[]{99});
		cutscenes.createAnimation("4", new int[]{3}, new int[]{99});
		cutscenes.createAnimation("5", new int[]{4}, new int[]{99});
		cutscenes.setAnimation("1");
		cutscenes.play();
		cutscenes.x = width/2;
		cutscenes.y = 275;

	}

	void process() {

		super.process();
		globalTextBox.process();

		if (input.keyEnter.enter || input.keyEnter.right) {
			if (!globalTextBox.finished) {

				if (globalTextBox.next()) {
					index++;
					changeCutscene();
				}

			} else {
				soundManager.pauseLoop("cutscene");
				sceneManager.changeScene("GameScene");
			}
		}

	}

	void draw(){
		background(0);

		globalTextBox.draw();

		cutscenes.draw();

		if (globalTextBox.finished) {
			fill(255);
			textSize(25);
			textAlign(CENTER);
			text("Aperte Espaço para Avançar", width/2, 650);
			textAlign(LEFT);
		}

	}

	void changeCutscene() {
		switch(index) {
			case 2:
				cutscenes.setAnimation("2");
				break;
			case 3:
				cutscenes.setAnimation("3");
				break;
			case 4:
				cutscenes.setAnimation("4");
				break;
			case 6:
				cutscenes.setAnimation("5");
				break;
		}
	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
