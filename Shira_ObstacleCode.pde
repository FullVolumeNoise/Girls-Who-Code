float x_block=20;
float y_block=450;
float ground=450;
float falling = 0;
float trix1 = 200;
float trix3 = trix1+50;
float trix2 = (trix1 + trix3)/2;
float tritop = 50;
int screen = 0;
//FOLLOWER TEST//
float speed=1.2;
Car myCar1;
Car myCar2;
Car myCar3;
int lives = 3;
//FOLLOWER TEST END//

void setup(){
  size(1800, 500);
  //FOLLOWER TEST
  myCar1 = new Car(color(25,30,0),40,100,20); 
  myCar2 = new Car(color(0,0,255),0,10,1);
  myCar3 = new Car(color(28,55,90),20,100,10);
  //FOLLOWER CODE END//
  smooth();
  fill (color(222, 22, 22));
  
}
    
void draw(){
 
  if (screen==0){ //game screen
   background(255, 255, 255);
    fill(0, 0, 0);
    if(keyPressed == false){
      falling = 0;
      y_block = ground;
      x_block += 1;
    }
  text(lives, 1700, 480);
  }
  //FOLLOWER CODE//
  myCar1.display();
  myCar2.display2();
  myCar3.display3();
  //FOLLOWER CODE END//
    keyPressed();
    rect(x_block,(y_block+falling), 50, 50); // coordinates of our block
    obstacles();

  
  if(screen==1){ //losing screen
    background(255);
    fill(0);
    textSize(24);
    String a = "You weren't able to make it past this obstacle, and woke up in an emergency room. The next morning, you were admited into Ingalls Memorial Hospital's Inpatient Psychiatry Care. After being discharged, you were set up with a therapist. And now, even though every day is battle to keep yourself alive, you keep fighting. (Press ENTER)";
    text(a, 360, 265, 700, 470);
    if(keyCode == ENTER){
      screen=0;
      x_block = 20;
      y_block = 450;
      lives = 3;
    }

  }
} 
void keyPressed(){
 if(key==CODED){
  if(keyCode == LEFT && 0<x_block){ //left arrow: go left
      x_block -= 5;
   }
  if(keyCode == RIGHT){ //right arrow: go right
      x_block += 5;
   }
  if(keyCode == UP && 0<=y_block){ //up arrow: jump
   if (falling == -130){ //before the peak, go down a tiny bit
    falling += 5;
   }
   if (falling <= -150){ //if in the air, then go down and right
    //x_block += 10;
    falling += 10;
    x_block += 20;
   }
   else{ //going up
     falling -= 20;
   }
  }
 }
}

void obstacles(){
  fill(244, 191, 66);
  noStroke();
  triangle(trix1, ground+50, trix2, ground-tritop, trix3, ground+50); //obstacle
  if((x_block+30)==trix1 || x_block==trix3){ //if hit, go to losing screen
    lives-=1;
    if(lives==0){
      screen = 1;
    }
  }
 }
//FOLLOWER CODE TEST//
class Car { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = x_block-40;
    ypos = y_block;
    xspeed = tempXspeed;
  }
  
  void display() {
    stroke(0);
    fill(20, 34, 99);
    rectMode(CENTER);
    xpos = x_block-60;
    ypos = y_block;
    rect(xpos,ypos,30,30);
      if(lives == 2){
        fill(255,255,255);
     }
  }
  void display2() {
    stroke(0);
    fill(200, 94, 199);
    rectMode(CENTER);
    xpos = x_block-70;
    ypos = y_block;
    rect(xpos,ypos,30,30);
  }
  void display3() {
    stroke(0);
    fill(210, 194, 19);
    rectMode(CENTER);
    xpos = x_block-90;
    ypos = y_block;
    rect(xpos,ypos,30,30);

     }
    //FOLLOWER TEST END//
  }
 
