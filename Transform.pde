class Transform {
  float x;
  float y;
  float r;

  Transform(float _x, float _y, float _r){
    x = _x;
    y = _y;
    r = _r;
  }

  void copyFromTransform(Transform t){
    x = t.x;
    y = t.y;
    r = t.r;
  }
}
