class Player {
  
  Transform transform;
  Transform speed;
  Transform acc;

  int state;

  final int ST_FLYING = 1;
  final int ST_ON_GROUND = 2;

  int parFlapSpeed = 30;
  int parFlySpeed = 5;

  Player(int x, int y) {
    state = ST_ON_GROUND;
    transform = new Transform(x, y, 0);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }
  
  void draw() {
    fill(0,0,0);
    rect(transform.x, transform.y, 20, 20);
  }
  
  void debugDraw(){
    fill(255, 0, 0);
    textSize(10);
    text("state:" + state, 0, 10);
  }
  
  void control(Pressed pressed){
    if (state == ST_ON_GROUND){
      if (pressed.flap) {
        state = ST_FLYING;
        speed.x += parFlapSpeed;
      }
    } 
    if (state == ST_FLYING) {
      if (pressed.flap) {
        speed.x += parFlapSpeed;
      }
      if (pressed.left) {
        transform.x -= parFlySpeed;
      }
      if (pressed.right) {
        transform.x += parFlySpeed;
      }
    }
    
  }
}
