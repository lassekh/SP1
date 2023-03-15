class Baloon {
  int baloonW;
  int baloonH;
  int baloonSpawnX;
  int baloonSpawnY;
  float baloonSpeed;

  Baloon() {
    baloonW = 20; //Width radius - half
    baloonH = 30; //Height radius - half
    baloonSpawnY = height+baloonH;
    baloonSpawnX = int(random(width));
  }
  
  void display() {
    ellipse(baloonSpawnX, baloonSpawnY, baloonW*2, baloonH*2);
  }
  
  void fly(float speed) {
    baloonSpeed = speed;
    baloonSpawnY -= baloonSpeed;
  }
  
  boolean isPopped(int mX, int mY) {
      if (mX >= baloonSpawnX-baloonW && mX <= baloonSpawnX+baloonW && mY >= baloonSpawnY-baloonH && mY <= baloonSpawnY+baloonH){
        return true;
      }
      return false;
  }
  
  boolean outOfBounds(){
    if(baloonSpawnY <= 0){
      return true;
    }
    return false;
  }
}
