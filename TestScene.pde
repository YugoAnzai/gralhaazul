class TestScene extends Scene{

	void setup() {

		globalTextBox.reset();
		globalTextBox.addLine("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porttitor mi vitae enim pretium iaculis. Integer nisi lectus, rutrum eu felis at, vehicula sagittis erat. Maecenas facilisis magna vel ligula tempus finibus. Vestibulum feugiat purus in ex iaculis sodales. Sed varius erat ut lectus posuere, sit amet feugiat nisi imperdiet. Maecenas eu egestas tortor, sit amet convallis massa. Nam eget massa eros. Proin facilisis fringilla massa at sollicitudin.");
		globalTextBox.addLine("Quisque nunc elit, viverra vel sem ut, volutpat cursus ligula. Nulla facilisi. Ut volutpat auctor odio non maximus. Nunc semper lobortis augue faucibus congue.");
		globalTextBox.addLine("Nunc dapibus lorem vitae nibh auctor pretium. Fusce ante magna, porta a ex sit amet, pulvinar feugiat quam. Etiam vel dui vel mauris consectetur pretium. Maecenas odio tortor, faucibus eu felis et, sollicitudin condimentum diam. Proin vel leo euismod, imperdiet mauris efficitur, dignissim sem. Maecenas eget ligula felis.");
		globalTextBox.addLine("Curabitur sit amet ante orci. Nullam pellentesque luctus ex sit amet porta. Morbi eu felis laoreet, placerat neque sit amet, condimentum libero. Aliquam sed pulvinar nisi. Quisque sagittis sem sit amet sagittis posuere. Integer quis tristique leo, vel tempus odio. Morbi volutpat sapien vel urna blandit luctus.");
		globalTextBox.addLine("Etiam ultrices felis in ultricies maximus. Nullam eleifend mauris sed convallis finibus. Donec aliquet magna non urna luctus auctor. Cras quis feugiat eros. Aliquam hendrerit ultricies enim, vel molestie arcu gravida a. Curabitur vel lorem ligula. Maecenas nisl nibh, volutpat a vulputate sed, faucibus vel eros.");

	}

	void process() {
		super.process();

		globalTextBox.process();
		

		if (input.keyEnter.enter || input.keyEnter.right) {
			if (!globalTextBox.finished) {
				globalTextBox.next();
			} else {
				println("Finished");
			}
		}


	}

	void draw(){
		background(0);

		globalTextBox.draw();

	}

	void debugDraw() {

	}

	void destroy(){
		super.destroy();
	}

}
