class GameObject {

  Transform pos;
  Transform speed;
  Transform acc;
  String name;
  Animator anim;

  GameObject(int x, int y, int r, String _name){
    name = _name;
    pos = new Transform(x, y, r);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

  GameObject(int x, int y, String _name){
    name = _name;
    pos = new Transform(x, y, 0);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

  GameObject(int x, int y, int r){
    name = "Default Object";
    pos = new Transform(x, y, r);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

  GameObject(int x, int y){
    name = "Default Object";
    pos = new Transform(x, y, 0);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

  void hit() {

  }

  void setup() {

  }

  void process() {

  }

  void draw() {

  }

  void debugDraw() {

  }

}
