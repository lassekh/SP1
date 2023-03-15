class Counter {
  int count;
  
  Counter(int count){
    this.count = count;
  }
  
  int plus(){
    return count++;
  }
  
  int minus(){
    return count--;
  }
}
