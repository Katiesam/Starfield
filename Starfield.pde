Particle [] bob=new Particle[1000];

void setup()
{
  size(500,500);
  bob=new Particle[1000];
  for (int i=0;i<bob.length;i++){
    bob[i]=new Particle();
    bob[0]=new OddballParticle();
  }
}

void draw()
{
  background(0);
  for (int i=0; i<bob.length; i++){
    bob[i].move();
    bob[i].show();
  }
}

void mousePressed(){
  redraw();
}

class Particle
{
  int myColor;
  double myX, myY, myAngle, mySpeed, mySize;
  
  Particle(){
    myColor=color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    myX=250;
    myY=250;
    myAngle=Math.random()*11;
    mySpeed=Math.random()*Math.PI;
    mySize=Math.random()*12;
  }
  
  void move(){
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;
  }
  
  void show(){
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}

class OddballParticle extends Particle
{
  OddballParticle(){
    myX=250;
    myY=250;
    mySize=50;
  }
  
  void move() {
    myX+=(int)(Math.random()*5)-2;
    if (myX>500){
      myX=0;
    }
    myY+=(int)(Math.random()*5)-2;
  }
  
  void show() {
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}
