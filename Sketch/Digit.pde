public class Digit{

  private int offset;
  private boolean x, y, z, p; // the number is written binary xyzp
  private int[] binary;
  private int rWidth = 110, rHeight = 15;
  private color[] col;
  private boolean[] line;

  Digit(int offset){
    this.offset = offset;
    col = new color[2];
    line = new boolean[7];
    binary = new int[4];

    col[0] = color(25);
    col[1] = color(255);

    registerMethod("draw", this);
  }
  void draw(){
    //0
    fill(col[line[0] ? 1 : 0]);
    rect(width / 2 + offset, 45, rWidth, rHeight, 20);
    //1
    fill(col[line[1] ? 1 : 0]);
    rect(width / 2 + offset, height / 2 - 10, rWidth, rHeight, 20);
    //2
    fill(col[line[2] ? 1 : 0]);
    rect(width / 2 + offset, height - 70, rWidth, rHeight, 20);
    //3
    fill(col[line[3] ? 1 : 0]);
    rect(width / 2 - rWidth / 2 - 20 + offset, 120, rHeight, rWidth, 20);
    //4
    fill(col[line[4] ? 1 : 0]);
    rect(width / 2 + rWidth / 2 + 20 + offset, 120, rHeight, rWidth, 20);
    //5
    fill(col[line[5] ? 1 : 0]);
    rect(width / 2 - rWidth / 2 - 20 + offset, 260, rHeight, rWidth, 20);
    //6
    fill(col[line[6] ? 1 : 0]);
    rect(width / 2 + rWidth / 2 + 20 + offset, 260, rHeight, rWidth, 20);
  }
  // GET THE DIGIT FORM
  public void setDigit(int n){
    getBinary(n);
    line[0] = f0();
    line[1] = f1();
    line[3] = f3();
    line[2] = f2();
    line[4] = f4();
    line[5] = f5();
    line[6] = f6();
  }
  // CONVERT A DIGIT INTO BINARY
  private void getBinary(int n){
    for(int i = 0; i < 4; i++){
      binary[i] = 0;
    }
    int i = 0;
    while(n != 0){
      binary[i++] = n % 2;
      n /= 2;
    }
    x = binary[3] == 1 ? true : false;
    y = binary[2] == 1 ? true : false;
    z = binary[1] == 1 ? true : false;
    p = binary[0] == 1 ? true : false;
  }
  // BOOLEAN FUNCTIONS
  private boolean f0(){
    return (!y&&!z&&!p || x&&!y&&!z || !x&&y&&p || !x&&z);
  }
  private boolean f1(){
    return (!x&&!y&&z || !x&&z&&!p || !x&&y&&!z || x&&!y&&!z);
  }
  private boolean f2(){
    return (!y&&!z&&!p || !x&&!y&&z || !x&&z&&!p || !x&&y&&!z&&p || x&&!y&&!z);
  }
  private boolean f3(){
    return (!x&&!z&&!p || !x&&y&&!z || !x&&y&&!p || x&&!y&&!z);
  }
  private boolean f4(){
    return (!x&&!y || !x&&!z&&!p || !x&&z&&p || x&&!y&&!z);
  }
  private boolean f5(){
    return (!y&&!z&&!p || !x&&z&&!p);
  }
  private boolean f6(){
    return (!y&&!z || !x&&y || !x&&z&&p);
  }

}
//     0
//   3   4
//     1
//   5   6
//     2
