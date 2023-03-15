ArrayList<Baloon> baloons = new ArrayList(); //Creates a new ArrayList of Baloon objects
Timer t; //Declare a timer to control when baloons fly
int countBaloons = baloons.size(); //Maximum number of baloons on screnn
int totalBaloons = 10; //Counter to keep count of total displayed baloons
Counter points = new Counter(0);
Counter lives = new Counter(3);

void setup() {
  //Set game window size
  size(800, 400);
  //Initialize new timer object
  t = new Timer(500);
  //Method to start timer
  t.startTimer();
}

void draw() {
  //Game background color
  background(255);
  //Gives baloon a random pixel speed between 1 and 5
  float randomSpeed = random(0, 1);
  //If timer object paramater is reached
  if (t.isFinished()) {
    //add new baloon to ArrayList
    baloons.add(new Baloon());
    t.startTimer();
  }
  
  for (Baloon b : baloons) {
    b.display();
    b.fly(randomSpeed);
  }
  //Removing baloons out of bounds
  //Using enhanced for loop will give error: ConcurrentModificationException
  for (int i = 0; i < baloons.size(); i++) {
    if(baloons.get(i).outOfBounds() && lives.count > 0){
      baloons.remove(i);
      lives.minus();
    }else if(lives.count == 0){
        randomSpeed = 0;
        text("GAME OVER!", width, height);
    }
  }
  
  text("Points: " + points.count, 10, 10);
  text("Lives: " + lives.count, 10, 20);
  fill(0);
}

//This function to utilize event when mouse is pressed
void mousePressed() {
  //If mousePressed == true
   if (mousePressed) {
     //Run through ArrayList.size() and get each index of objects
     for(int i = 0; i < baloons.size(); i++){
       //Check if objects are hit and if they are remove from ArrayList
       boolean hit = baloons.get(i).isPopped(mouseX, mouseY);
       if(hit){
        baloons.remove(i);
        println(points.plus());
      }
     }
   }
}
