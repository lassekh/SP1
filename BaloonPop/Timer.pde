class Timer {
  int savedTime;
  int totalTime;
  
  Timer(int totalTime) {
    this.totalTime = totalTime;
  }
  
  void startTimer() {
    savedTime = millis();
  }
  
  boolean isFinished() {
    int passedTime = millis() - savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
