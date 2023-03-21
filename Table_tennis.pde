float sw = 100; // 
float sh = 20;
float cx,cy,dx,dy;
float ex,ey,fx,fy;
float bs = 20;
int score=0;
float [] xx;
float [] yy;
float [] vx;
float [] vy;
import processing.sound.*;
SoundFile file;
void setup(){
  size(1280,720);
  rectMode(CENTER);
  file = new SoundFile(this, "UndertaleStartMenu.mp3");
  file.play();
  file.loop();
  rectX1 = 640;
  rectX2 = 640;
  xx2  = random(500,780);
  yy2 = random(300,420);
  vx2  = 3;
  vy2 =  5;
  xx = new float [5];
  yy = new float [5];
  vx = new float [5];
  vy = new float [5];
  cx = random(0,width);
  ex = random(0,width);
  cy = random(height/5,4*height/5);
  ey = random(height/5,4*height/5);
  
  for (int i=0; i<5; i++) {
    xx[i] = width/2;
    yy[i]=0;
    vx[i] = random (0,10);
    vy[i] = random (10);
  }

}
void draw(){
  background(0);
  textSize(64);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Table Tennis", width/2, height/2-200);
  textSize(20);
  text("\u00A9 2023 GaekGI Corp. All Right Reserved", 200, height - 30);
  text("BGM  'StartMenu-Toby Fox'",width-120,height - 30);
  textSize(45);
  fill(255);
  ellipse(width/2+200,height/2, 30, 50);
  ellipse(width/2+200,height/2+100,30 ,50);
  noStroke();
  rect(width/2,height/2,400,50);
  rect(width/2,height/2+100,400,50);
  stroke(0);
  ellipse(width/2-200,height/2, 30,50);
  ellipse(width/2-200,height/2+100,30,50);
  fill(80 ,80 , 80 );
  noStroke();
  ellipse(width/2-200,height/2, 27,45);
  ellipse(width/2-200,height/2+100,27,45);
  stroke(0);
  fill(0,0,0);
  text("SinglePlayer",width/2,height/2-10);
  text("MultiPlayer",width/2,height/2+90  );
  fill(255);
  circle(xx3,yy3,30);

  xx3 += vx3;
  yy3 += vy3;
  if (xx3 < 0 || xx3 > width) {
    vx3 *= -1;
  }
  if (yy3 < 0 || yy3 > height) {
    vy3 *= -1;
  }

  if (xx3 > width/2-215 && xx3 < width/2+215) {
    if (yy3 > height/2-50 && yy3 < height/2+75) {
      vy3 *= -1;
    }
    if (yy3 > height/2+30 && yy3 < height/2+130) {
      vy3 *= -1;
    }}
 if (xx3 < width/2-200&& yy3 > height - 50){
   vy3*= -1;
 }
 if (xx3 > width - 200 && yy3 > height - 50){
   vy3*= -1;
 }
 if (xx3 > width/2 -220 & xx3 < width/2+220 & yy3 < height/2 -200 & yy3 > height/2 - 220){
   vy3*= -1;
 }
  if (xx3 > width/2 -220 & xx3 < width/2+220 & yy3<  height/2- 140 & yy3 > height/2 - 150){
   vy3*= -1;
 }
  if(key1){
  draw1();}
  else if (key2){
    draw2();}
}
void draw1(){
  background(0);
  textSize(64);
  score++;
  fill(255,255,255);
  rect(mouseX,height-20,sw, sh);
  
  for (int i=0; i<5; i++){
    xx[i] += vx[i];
    yy[i] += vy[i];
  }
  
  for (int i=0; i<5; i++){
    if ( xx[i]<0 || xx[i]> width) { 
      vx[i] = -vx[i];
    }
    if ( yy[i]<0) { 
      vy[i] = -vy[i];
    }
  }   

  

  if ( yy[0] > height && yy[1] > height && yy[2] > height && yy[3] > height && yy[4] > height){
    textSize(64);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);
    noLoop();
  }
  for(int i=0; i<5; i++){
    
    if ( mouseX-sw/2 < xx[i] && mouseX+sw/2 > xx[i] && yy[i] > height-20-sh-bs/2 && yy[i] < height-20-sh) {
    vy[i] = - vy[i];
    
    }
     
  }
  for (int i=0; i<5; i++) {
   circle(xx[i], yy[i], bs);
  }

  
  
  textSize(64);
  textAlign(CENTER,CENTER);
  text(score/60,width/2,30);
  
  obstacle_red();
  for (int i=0; i<5; i++){
    if ( cx-40 < xx[i] && cx+40 >xx[i]&& cy-40 < yy[i] && cy+40 > yy[i]){
      if(vx[i]<0){vx[i]=-vx[i]+2;}
      else if (vx[i]>0){vx[i]=-vx[i]-2;}
    }
    if ( cx-40 < xx[i] && cx+40 >xx[i]&& cy-40 < yy[i] && cy+40 > yy[i]){
      if(vy[i]<0){vy[i]=-vy[i]+2;}
      else if (vy[i]>0){vy[i]=-vy[i]-2;}
    }
      
      
  }
  
  obstacle_blue();
  for (int i=0; i<5; i++){
    if ( ex-40 < xx[i] && ex+40 >xx[i]&& ey-40 < yy[i] && ey+40 > yy[i]){
      if(vx[i]<0){vx[i]=-vx[i]-2;}
      else if (vx[i]>0){vx[i]=-vx[i]+2;}
    }
    if ( ex-40 < xx[i] && ex+40 >xx[i]&& ey-40 < yy[i] && ey+40 > yy[i]){
      if(vy[i]<0){vy[i]=-vy[i]-2;}
      else if (vy[i]>0){vy[i]=-vy[i]+2;}
    }    
           
      
  }
}

  
  
void obstacle_red(){
  fill(255,0,0);
  circle(cx,cy,60);
  
}

void obstacle_blue(){
  fill(0,0,255);
  circle(ex,ey,60);
}
