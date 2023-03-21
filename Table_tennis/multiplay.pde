float sw2 = 100;  
float sh2 = 20;
float bs2 = 20;
int score1=0;
int score2=0;
float xx2;
float yy2;
float vx2;
float vy2;
float rectX1 = 640;
float rectX2 = 640;
float xx3 = 280;
float yy3 = 400;
float vx3 = 5;
float vy3 = 5;
boolean keyA = false;
boolean keyD = false;
boolean keyLeft = false;
boolean keyRight = false;
boolean key1 = false;
boolean key2 = false;
void keyPressed(){
    if (key == 'a') {
        keyA = true;
    }
    if (key == 'd') {
        keyD = true;
    }
    if (keyCode == LEFT) {
        keyLeft = true;
    }
    if (keyCode == RIGHT) {
        keyRight = true;
     
    } 
    if(key=='1'){
        key1 = true;
  }
    
    if (key =='2'){
        key2 = true;
  }
  }

void keyReleased() {
    if (key == 'a') {
        keyA = false;
    }
    if (key == 'd') {
        keyD = false;
    }
    if (keyCode == LEFT) {
        keyLeft = false;
    }
    if (keyCode == RIGHT) {
        keyRight = false;
    }
}





void draw2(){
  background(0);
  fill(255,0,0);
  rect(rectX1,height-20,sw2, sh2);
  fill(0,0,255);
  rect(rectX2,20,sw2,sh2);
    if (keyA && keyLeft) {
        rectX1 -= 5;
        rectX2 -= 5;
    }
    else if (keyD && keyRight) {
        rectX1 += 5;
        rectX2 += 5;
    }
    else if (keyA && keyRight) {
        rectX1 -= 5;
        rectX2 += 5;
    }
    else if (keyD && keyLeft) {
        rectX1 += 5;
        rectX2 -= 5;
    }
    else if (keyA)
    {rectX1 -= 5;}
    else if (keyD)
    {rectX1 += 5;}
    else if (keyLeft)
    {rectX2 -= 5;}
    else if (keyRight)
    {rectX2 +=5;}
  xx2 += vx2;
  yy2 += vy2;
  
  if ( xx2<0 || xx2 > width) { 
      vx2 = -vx2;
    }
  if ( yy2<0) { 
      vy2 = -vy2 ;
    }
  if (yy2<0) {
    score2+=1;
    xx2  = width/2;
    yy2 =100;
  }
  if (yy2>height) {
    score1+=1;
    xx2  = width/2;
    yy2 =100;  
  }
  
  if(rectX1+50>width)
    {rectX1=50;}
    else if(rectX1-50<0)
    {rectX1=width-50;}
  if(rectX2+50>width)
    {rectX2=50;}
    else if(rectX2-50<0)
    {rectX2=width-50;}
  
  
    
  

  if (score1==5|score2==5){
    textSize(64);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Game Over", width/2, height/2);
    noLoop();
  }
  if ( rectX1-sw2/2 < xx2 && rectX1+sw2/2 > xx2 && yy2 > height-20-sh2-bs2/2 && yy2 < height-20-sh2) {
    vy2 = - vy2;
  }
  if (rectX2 - sw2/2 < xx2 && rectX2 + sw2/2 > xx2 && yy2 < 20 + sh2 + bs2/2 && yy2 > 20 + sh2) {
    vy2 = -vy2;
} 
  if (keyA & vx2>0 & rectX1-sw/2 < xx2 && rectX1+sw/2 > xx2 && yy2 > height-20-sh-bs/2 && yy2 < height-20-sh){
    vx2 = -vx2;
} 
  if (keyD & vx2<0 & rectX1-sw/2 < xx2 && rectX1+sw/2 > xx2 && yy2 > height-20-sh-bs/2 && yy2 < height-20-sh){
    vx2 = -vx2;
} 
  if (keyLeft & vx2>0 & rectX2 - sw/2 < xx2 && rectX2 + sw/2 > xx2 && yy2 < 20 + sh + bs/2 && yy2 > 20 + sh) {
    vx2 = -vx2;
  }
  if (keyRight & vx2<0 & rectX2 - sw/2 < xx2 && rectX2 + sw/2 > xx2 && yy2 < 20 + sh + bs/2 && yy2 > 20 + sh) {
    vx2 = -vx2;}
  fill(255);
  ellipse(xx2, yy2, bs2, bs2);
  
  textSize(64);
  textAlign(CENTER,CENTER);
  fill(0,0,255);
  text(score1,1000,300);
  fill(255,0,0);
  text(score2,1000,420);
}
