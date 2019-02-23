class GameObject {

  Transform pos;
  Transform speed;
  Transform acc;

  GameObject(int x, int y, int r){
    pos = new Transform(x, y, r);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }

}
