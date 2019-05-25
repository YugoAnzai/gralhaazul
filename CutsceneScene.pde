class CutsceneScene extends Scene{

	int index = 1;
	int totalIndex = 4;
	int maxTimer = 100;
	int timer = maxTimer;

	Animator anim;

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

	}

	void process() {

		super.process();
		globalTextBox.process();

		if (input.keyEnter.enter || input.keyEnter.right) {
			if (!globalTextBox.finished) {
				globalTextBox.next();
			} else {
				soundManager.pauseLoop("cutscene");
				sceneManager.changeScene("GameScene");
			}
		}

	}

	void draw(){
		background(0);
		globalTextBox.draw();

		if (globalTextBox.finished) {
			fill(255);
			textSize(25);
			textAlign(CENTER);
			text("Aperte Espaço para Avançar", width/2, 650);
			textAlign(LEFT);
		}

	}

	void debugDraw() {
	}

	void destroy(){
		super.destroy();
	}

}
