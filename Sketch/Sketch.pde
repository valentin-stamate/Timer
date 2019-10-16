

int rWidth = 200, rHeight = 15;
color[] col;
boolean[] line;

int[] binary;
boolean x, y, z, p; // the number is written binary xyzp

void setup(){
  size(600, 600, P2D);
  background(20);
  rectMode(CENTER);
  noStroke();

  col = new color[2];
  line = new boolean[7];
  binary = new int[4];

  col[0] = color(40);
  col[1] = color(255);

  makeDigit(7);

}

void draw(){
  background(20);

  drawDigit();
}

void drawDigit(){
  //0
  fill(col[line[0] ? 1 : 0]);
  rect(width / 2, 50, rWidth, rHeight, 10);
  //1
  fill(col[line[1] ? 1 : 0]);
  rect(width / 2, height / 2, rWidth, rHeight, 10);
  //2
  fill(col[line[2] ? 1 : 0]);
  rect(width / 2, height - 50, rWidth, rHeight, 10);
  //3
  fill(col[line[3] ? 1 : 0]);
  rect(width / 2 - rWidth / 2 - 40, 175, rHeight, rWidth, 10);
  //4
  fill(col[line[4] ? 1 : 0]);
  rect(width / 2 + rWidth / 2 + 40, 175, rHeight, rWidth, 10);
  //5
  fill(col[line[5] ? 1 : 0]);
  rect(width / 2 - rWidth / 2 - 40, height - 175, rHeight, rWidth, 10);
  //6
  fill(col[line[6] ? 1 : 0]);
  rect(width / 2 + rWidth / 2 + 40, height - 175, rHeight, rWidth, 10);
}

void makeDigit(int n){
  getBinary(n);
  line[0] = f0();
  line[1] = f1();
  line[3] = f3();
  line[2] = f2();
  line[4] = f4();
  line[5] = f5();
  line[6] = f6();
}

boolean f0(){
  return (!y&&!z&&!p || x&&!y&&!z || !x&&y&&p || !x&&z);
}
boolean f1(){
  return (!x&&!y&&z || !x&&z&&!p || !x&&y&&!z || x&&!y&&!z);
}
boolean f2(){
  return (!y&&!z&&!p || !x&&!y&&z || !x&&z&&!p || !x&&y&&!z&&p || x&&!y&&!z);
}
boolean f3(){
  return (!x&&!z&&!p || !x&&y&&!z || !x&&y&&!p || x&&!y&&!z);
}
boolean f4(){
  return (!x&&!y || !x&&!z&&!p || !x&&z&&p || x&&!y&&!z);
}
boolean f5(){
  return (!y&&!z&&!p || !x&&z&&!p);
}
boolean f6(){
  return (!y&&!z || !x&&y || !x&&z&&p);
}

void getBinary(int n){
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
  //showBinary();
}

void showBinary(){
  for(int i = 0; i < 4;i ++){
    print(binary[3 - i] + " ");
  }
  println();
}
//     0
//   3   4
//     1
//   5   6
//     2
