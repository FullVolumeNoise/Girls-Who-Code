int radius = 10, directionX = 1, directionY = 0;
float x=20, y=20, speed=1.5;
//FOLLOWER TEST//
Car myCar1;
Car myCar2;
Car myCar3;
// =========================================================
void setup()
{
  size(500, 500);
  smooth();
  fill (color(222, 22, 22));
  ellipseMode(RADIUS);
  //FOLLOWER TEST
  myCar1 = new Car(color(25,30,0),40,100,20); 
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(28,55,90),20,100,10);
  
}
void draw()
{ //FOLLOWER TEST
      background(100, 30, 87);

  myCar1.display();
  myCar2.display2();
  myCar3.display3();
  //FOLLOWER TEST END

  // changing Position
  x= x + speed*directionX;
  y= y + speed*directionY; 
  // check boundaries
  if ((x>width-radius) || (x<radius))
  {   
    directionX=-directionX;
  }
  if ((y>height-radius) || (y<radius))
  {   
    directionY=-directionY;
  } 
  // draw
  // if(direction==1)
  // rect(x, y, 20, 20);
  fill (color(242, 22, 22)); 
  ellipse (x, y, radius, radius);    // body
  fill (color(22, 82, 22)); 
  ellipse (x-4, y-4, 2, 2);  // the eye
}
// =========================================================
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      //if (directionX>0) { 
      directionX=-1;
      directionY=0;
      //}
    }
    else if (keyCode == RIGHT)
    {
      //if (directionX<0) {  
      directionX=1;
      directionY=0;
      //}
    }
    else if (keyCode == UP)
    {
      //if (directionY<0) {
      directionY=-1;
      directionX=0;
      //}
    }
    else if (keyCode == DOWN)
    {
      //if (directionY<0) { 
      directionY=1;
      directionX=0;
      //}
    }
  }
}
//FOLLOWER TEST
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = x-40;
    ypos = y-10;
    xspeed = tempXspeed;
  }

  void display() {
    stroke(0);
    fill(20, 34, 99);
    rectMode(CENTER);
    xpos = x-60;
    ypos = y-0;
    rect(xpos,ypos,30,30);
  }
  void display2() {
    stroke(0);
    fill(200, 94, 199);
    rectMode(CENTER);
    xpos = x-70;
    ypos = y-0;
    rect(xpos,ypos,30,30);
  }
  void display3() {
    stroke(0);
    fill(210, 194, 19);
    rectMode(CENTER);
    xpos = x-90;
    ypos = y-0;
    rect(xpos,ypos,30,30);
  }
}
