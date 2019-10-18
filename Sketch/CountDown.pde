class CountDown implements Runnable{
  private Thread t;
  boolean pause;

  CountDown(){
    pause = false;
  }

  @Override
  void run(){

    while(Time != 0){

      while(pause){
        sleep();
      }

      timer.setDigit(--Time);
      sleep();
    }

    t = null;
  }

  public void start(){
    if(t == null){
      t = new Thread(this);
      t.start();
    }
    pause = false;
  }

  public void Pause(){
    pause = true;
  }

  private void sleep(){
    try{ Thread.sleep(1000); } catch(Exception e){}
  }

}
