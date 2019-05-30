class OverworldLevel {

  int x, y;

  boolean selected = false;
  boolean locked = false;
  boolean completed = false;
  String name;

  int textOffset = 60;

  Animator circle;

  OverworldLevel(int _x, int _y, String _name, boolean _completed, boolean _locked) {
    x = _x;
    y = _y;
    completed = _completed;
    locked = _locked;
    name = _name;

    circle = new Animator(0, 0, "level.png", 2, 1);
		circle.createAnimation("completed", new int[]{0}, new int[]{99});
		circle.createAnimation("uncompleted", new int[]{1}, new int[]{99});
    circle.setAnimation("uncompleted");
    circle.play();
    circle.x = x;
    circle.y = y;

  }


  void draw() {

    if (!locked) {

      if (selected) tint(200);

      if (completed) circle.setAnimation("completed");

      circle.draw();
      tint(255);

      fill(0);
      textSize(18);
      textAlign(CENTER);
      text(name, x, y + textOffset);
      textAlign(LEFT);

    }

  }

}
