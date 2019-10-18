public class Timer{

  Digit d1, d2, d3, d4;

  Timer(){
    d1 = new Digit(390);
    d2 = new Digit(150);
    d3 = new Digit(-150);
    d4 = new Digit(-390);
    registerMethod("draw", this);
  }

  // DRAW THE TIMER
  void draw(){
    fill(255);
    circle(width / 2, 120, 35);
    circle(width / 2, 270, 35);
  }

  public void setDigit(int n){
    d1.setDigit(n % 60 % 10);
    d2.setDigit(n % 60 / 10 % 10);
    d3.setDigit(n / 60 % 10);
    d4.setDigit(n / 60 / 10 % 10);
  }

}

// DIGIT ORDER 4 3 : 2 1
