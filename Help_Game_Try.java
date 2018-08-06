//global
int lives = relief
int relief = 0;
float gravity=0.1;// the game's gravity
float pspeed=5; //Player speed
boolean dead = false;
int screen = 0;
int w = 200;
int h = 715;
PImage img;
int ex;
//px = square x coordinate
//py = square y coordinate

int[][] blocks = {

  //boundary box

  {
    0, h, w, 20, 1
  }
  ,

  /*platforms*/
  //  platForm(X,Y,width,height);

  {
    200, 620, 270, 20, 1
  }
  ,
  {
    525,520,270,20,1
  }
  ,
  {
    200,415,270,20,1
  }
  ,
  {
    650,330,270,20,1
  }
  ,
  {
    1050,520,270,20,1
  }
  ,
  {
    850,680,100,20,1
  }
  ,
  {
    1450,650,200,20,1
  }
  ,
};

void setup() {
  size(1880, 720);
  frameRate(30);
  img = loadImage("https://cdn2.vectorstock.com/i/1000x1000/17/06/wall-brick-seamless-pattern-black-vector-2361706.jpg");

}
class Player {
  rectMode(CENTER);
  noStroke();
  px=280,py=280,//players x and y cords
  pxv=0,pyv=0,//players x and y velocity
  pw=20,ph=20,//players width and height
  sx=280,sy=280,//players spawn cords
}
float psize = pw*ph

class relief {
  rectMode(CENTER);
  noStroke();
  rx=207,ry=615, //Relief x and y coordinates
  rw=3,rh=3, //Relief width and height
  rsx=random(100, 130), rsy=random(-50, 102) //Randomly spawn Relief between x =(100-130) and y=(-50, 102)
}

void draw() {
  //SCROLLING BG
      int ex = frameCount % img.width;
  copy(img, ex, 0, img.width, height, 0, 0, img.width, height);
  int ex2 = img.width - ex;
  if (ex2 < width) {
    copy(img, 0, 0, img.width, height, ex2, 0, img.width, height);
  }
  playerInput();
  playerUpdate();
  blockUpdate();
}
float ORightEdge = Ox + Ow/2; //Right egde of obstacle(1) is the x coordinate + 1/2 of width

class Obstacles {
  rectMode(CENTER);
  noStroke();
  Ox=201,Oy=619, //Obstacle x and y coordinates
  Ow=5,Oh=21,  //Obstacle width and height
  Osx=201,Osy=619, //Obstacle Spawn coordinates

}

//ON DEATH
if dead = false; {
  void keyPressed(); }

if dead = true; {exit}

//====FUNCTIONS===============================================================//
//MOVEMENTS FUNCTION//
void keyPressed() {
  if (key == CODED)
  {
    if (keyCode == LEFT){
      (x + 1)}
    else if (keyCode == RIGHT){
      (x-1)}
    else if (keyCode == UP){
      (y+1) }
    else if (keyCode == DOWN){
        (y-1)
      else if (px == blocks.y) {
        (y+0)
        }
      }
    }
  }
void ObstacleCollision(){
    if(px + pw >= Ox &&    // r1 right edge past r2 left
      px <= Ox + Ow &&) {
        dead = true;
      }    // r1 left edge past r2 right
  }
void playerUpdate() {
    px+=pxv;
    py+=pyv;

    fill(255, 0, 0);
    if(py > height){
      exit();
    }
    fill(255,160,122);
    rect(px, py, pw, ph);
  }
void blockUpdate() {
    for (int i = 0; i<blocks.length; i++) {

        fill(142, 116, 213);

      if (blocks[i][4]==0) {
      }

      if (px+pxv+psize>blocks[i][0] && px+pxv<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
        if (blocks[i][4]==0) {
          dead=true;
        }
        pxv=0;
      }

      if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+pyv+psize>blocks[i][1] && py<blocks[i][1]+blocks[i][3]) {
        if (blocks[i][4]==0) {
          dead=true;
        }

        pyv=0;
        gravity=0;
        falling = false;
      }

      if (px+psize>blocks[i][0] && px<blocks[i][0]+blocks[i][2] && py+psize>blocks[i][1] && py+pyv<blocks[i][1]+blocks[i][3]) {
        if (blocks[i][4]==0) {
          //print("Wowow look at that");
          dead=true;
        }

        pyv=0;
        gravity=0;
      }

      rect(blocks[i][0], blocks[i][1], blocks[i][2], blocks[i][3]);
    }
  }
