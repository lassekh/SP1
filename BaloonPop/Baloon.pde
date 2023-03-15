class Baloon {
  int baloonW; //Baloon width radius
  int baloonH; //Baloon height radius
  int baloonSpawnX; //New Baloon spawn point at X-axis
  int baloonSpawnY; //New Baloon spawn point at Y-axis
  float baloonSpeed; //The pixel speed at which a Baloon moves

  Baloon() {
    baloonW = 20; //Width radius - half
    baloonH = 30; //Height radius - half
    baloonSpawnY = height+baloonH; //Spawn just below game window
    baloonSpawnX = int(random(width)); //Spawn at a random point on X-axis
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(baloonSpawnX, baloonSpawnY, baloonW*2, baloonH*2);
    triangle(baloonSpawnX, baloonSpawnY+baloonH, baloonSpawnX+baloonW/3, baloonSpawnY+baloonH+baloonW/2, baloonSpawnX-baloonW/3, baloonSpawnY+baloonH+baloonW/2);
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
