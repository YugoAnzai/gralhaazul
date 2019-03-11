class Transform {
  float x;
  float y;
  float r;

  Transform(float tempX, float tempY, float tempR){
    x = tempX;
    y = tempY;
    r = tempR;
  }

  void copyFromTransform(Transform t){
    x = t.x;
    y = t.y;
    r = t.r;
  }
}
