class OverworldLevel {

  int x, y;

  boolean selected = false;
  boolean locked = false;
  int completion = 0;
  String name;

  int textOffset = 50;

  Animator circle;

  OverworldLevel(int _x, int _y, String _name, int _completion, boolean _locked) {
    x = _x;
    y = _y;
    locked = _locked;
    completion = _completion;
    name = _name;

    circle = new Animator(0, 0, "overworldLevel.png", 1, 1);
		circle.createAnimation("idle", new int[]{0}, new int[]{99});
		circle.setAnimation("idle");
    circle.x = x;
    circle.y = y;

  }


  void draw() {

    if (!locked) {
      if (selected) {
        tint(200);
      }
      circle.draw();
      tint(255);

      fill(0);
      textSize(14);
      textAlign(CENTER);
      text(name, x, y + textOffset);
      textAlign(LEFT);

    }

  }

}
