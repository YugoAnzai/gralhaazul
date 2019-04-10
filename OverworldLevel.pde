class OverworldLevel {

  int x, y;

  boolean selected = false;
  boolean locked = false;
  int completion = 0;

  Animator circle;

  OverworldLevel(int _x, int _y, int _completion, boolean _locked) {
    x = _x;
    y = _y;
    locked = _locked;
    completion = _completion;

    circle = new Animator(0, 0, "overworldLevel.png", 1, 1);
		circle.createAnimation("idle", new int[]{0}, new int[]{99});
		circle.setAnimation("idle");
    circle.x = x;
    circle.y = y;

  }


  void draw() {

    if (selected) {
      tint(200);
    }
    if (locked) {
      tint(255, 0, 0);
    }
    
    circle.draw();
    tint(255);

    if (completion > 0) {

    }


  }

}
