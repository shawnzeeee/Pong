import fisica.*;
float dx1,dy1;
float dx2, dy2;
float x1,y1;
float x2,y2;
boolean wkey,skey, dkey, akey;
boolean upkey, downkey, rightkey, leftkey;
color c;
FBox p1;
FBox p2;
FWorld world;
FCircle ball;
void setup(){
  fullScreen();
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0,0);
  p1 = new FBox(25,100); 
  p1.setStatic(false);
  p1.setFill(0);
  p1.setPosition(100,height/2);
  world.add(p1);
  p2 = new FBox(25,100); 
  p2.setStatic(false);
  p2.setFill(0);
  p2.setPosition(width- 100,height/2);
  world.add(p2);
  leftTopWall();
  leftBottomWall();
  rightTopWall();
  rightBottomWall();
  topWall();
  bottomWall();
  ball = new FCircle (50);
  ball.setPosition(width/2,height/2);
  ball.setFill(0);
  ball.setRestitution(1.5);
  ball.setDensity(0.2);
  world.add(ball);
}

void draw(){
  background(255);
  world.step();
  world.draw();
  player1();
  player2();
  ballCollisions();
  ball.setFillColor(c);
  if(ball.getX() <0 || ball.getX() > width){
    ball.setPosition(width/2,height/2);
      p1.setPosition(100,height/2);
        p2.setPosition(width- 100,height/2);
  }
}
void ballCollisions(){
  ArrayList<FContact> ballContacts;
  ballContacts = ball.getContacts();
  
  int i = 0;
  while (i < ball.getContacts().size()){
    FContact object = ballContacts.get(i);
    if(object.contains (p1)){
      c = #0310FA;
    }
    if(object.contains (p2)){
      c = #FA0330;
    }
    i += 1;
  }
}
void leftTopWall(){
  FPoly p = new FPoly();
  p.vertex(0,0);
  p.vertex(50,0);
  p.vertex(50,400);
  p.vertex(0,400);
  p.setFill(0);
  p.setStatic(true);
  p.setFriction(0.1);
  world.add(p);
}

void leftBottomWall(){  
  FPoly p = new FPoly();
  p.vertex(0,height);
  p.vertex(50,height);
  p.vertex(50,height - 400);
  p.vertex(0,height - 400);
  p.setFill(0);
  p.setStatic(true);
  p.setFriction(0.1);
  world.add(p);  
  
}
void topWall(){
  FPoly p = new FPoly();
  p.vertex(0,0);
  p.vertex(0,50);
  p.vertex(width,50);
  p.vertex(width, 0);
  p.setFill(0);
  p.setStatic(true);
  p.setFriction(0.1);
  world.add(p);
  
  
}

void rightTopWall(){
  FPoly p = new FPoly();
  p.vertex(width,0);
  p.vertex(width - 50,0);
  p.vertex(width - 50,400);
  p.vertex(width,400);
  p.setFill(0);
  p.setStatic(true);
  p.setFriction(0.1);
  world.add(p); 
  
}

void rightBottomWall(){
  FPoly p = new FPoly();
  p.vertex(width,height);
  p.vertex(width - 50,height);
  p.vertex(width - 50,height - 400);
  p.vertex(width,height - 400);
  p.setFill(0);
  p.setStatic(true);
  p.setFriction(0.1);
  world.add(p);
 }

void bottomWall(){ 
  FPoly p = new FPoly();
  p.vertex(0,height);
  p.vertex(0,height - 50);
  p.vertex(width,height - 50);
  p.vertex(width, height);
  p.setFill(0);
  p.setStatic(true);
  p.setFriction(0.1);
  world.add(p);
}
void Ball(){
}
void player1(){
  if (wkey == true){
   if (dy1 > -500){
    dy1 -= 20; 
   }
  }
  if (skey == true){
   if (dy1 < 500){
    dy1 += 20; 
   }
  }
  if (wkey == false && skey == false){
   dy1 = 0; 
  }
  if (dkey == true){
   if (dx1 < 500){
    dx1 += 20; 
   }
  }
  if (akey == true){
   if (dx1 > -500){
    dx1 -= 20; 
   }
  }
  if (akey != true && dkey!= true){
    dx1 = 0;
  }
  if (dy1 != 0){ 
  p1.setRotation(atan(dx1/dy1));
  }
  p1.setVelocity(dx1,dy1);
}
void player2(){
  if (upkey == true){
   if (dy2 > -500){
    dy2 -= 20; 
   }
  }
  if (downkey == true){
   if (dy2 < 500){
    dy2 += 20; 
   }
  }
  if (upkey == false && downkey == false){
   dy2 = 0; 
  }
  if (rightkey == true){
   if (dx2 < 500){
    dx2 += 20; 
   }
  }
  if (leftkey == true){
   if (dx2 > -500){
    dx2 -= 20; 
   }
  }
  if (rightkey != true && leftkey!= true){
    dx2 = 0;
  }
  if (dy2 != 0){
  p2.setRotation(atan(dx2/dy2));
  }
  p2.setVelocity(dx2,dy2);
}
void keyPressed(){
 if (key == 'w' || key == 'W'){
   wkey = true;
 }
 if (key == 's' || key == 'S'){
   skey = true; 
 }
 if (key == 'd' || key == 'D'){
   dkey = true;
 }
 if (key == 'a' || key == 'A'){
  akey = true; 
 }
 if (keyCode == UP){
   upkey = true;
 }
 if (keyCode == DOWN){
   downkey = true;
 }
 if (keyCode == RIGHT){
   rightkey = true;
 }
 if (keyCode == LEFT){
   leftkey = true;
 }
}

void keyReleased(){
 if (key == 'w' || key == 'W'){
   wkey = false;
 }
 if (key == 's' || key == 'S'){
   skey = false; 
 } 
 if (key == 'd' || key == 'D'){
   dkey = false;
 }
 if (key == 'a' || key == 'A'){
   akey = false; 
 } 
 if (keyCode == UP){
   upkey = false;
 }
 if (keyCode == DOWN){
   downkey = false;
 }
 if (keyCode == RIGHT){
   rightkey = false;
 }
 if (keyCode == LEFT){
   leftkey = false;
 }
}