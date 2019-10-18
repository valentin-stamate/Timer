import controlP5.*;

ControlP5 cp5;
Timer timer;
CountDown cd;
int Time = 0, newTime = 0;

void setup(){
  size(1200, 400, P2D);
  background(20);
  rectMode(CENTER);
  noStroke();

  timer = new Timer();
  cd = new CountDown();

  cp5 = new ControlP5(this);
  cp5.addSlider("modify")
    .setRange(0, 1440)
    .setPosition(30, height - 20)
    .setSize(width - 100, 20)
  ;
}

void draw(){
  background(20);
}

void modify(int value){
  timer.setDigit(value);
  cd.Pause();
  newTime = value;
}

void mouseReleased() {
  if(newTime != Time){
    Time = newTime;
    cd.start();
  }
}
