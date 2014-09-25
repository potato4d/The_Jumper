Player player = new Player();
Wall[] walls  = new Wall[4];

int count = 0;
final float Base = 128;

PImage Logo = new PImage();
boolean isStart    = false;
boolean notGameOver = true;
final float[] HEIGHT = {64, 96, 160, 128, 222, 222};

void setup(){
  size(640, 480);
  frameRate(60);
  background(255);
  Logo = loadImage("Logo.png");
  
  fill(0);
  noStroke();
  rect(0, 400, 640, 480);

  restart();
}

void draw(){
  
  // pjs only
  //if(p5_Restart()) restart();
  
  if(notGameOver){
    if(isStart){
      game();
    }else{
      top();
    }
  }

}

void top(){
  SetDrawScreen();
  image(Logo, 73, 0);
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("Tap to Start", width/2, 380);
  
  textSize(14);
  textAlign(RIGHT);
  text("Controll Guide", 600, 180);
  text("Tap to Jump(Double Jump)", 600, 210);
  player.show();
}

void game(){
  SetDrawScreen();
  showDistance();

  player.update();
  player.show();

  for(int i=0; i<walls.length; i++){
    walls[i].show(player.distance);
  }
  
  Collision();
  Spawn();
  if(!notGameOver) gameover();
}

void gameover(){
  // pjs only
  // SetScore(nfc(player.distance, 1));
  
  textSize(32);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2+16);

  fill(255, 0, 0);
  textSize(16);
  text("Distance:"+nfc(player.distance, 1)+"m", width/2, height/2+32);
  
  if(getWidth() >= 640){
    fill(0);
    stroke(255);
    rect(220, 430, 80, 30);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("Tweet", 260, 454);
    noStroke();
    
    fill(0);
    stroke(255);
    rect(360, 430, 80, 30);
    fill(255);
    textSize(16);
    textAlign(CENTER);
    text("ReStart", 400, 454);
    noStroke();
  }
}


void mouseClicked(){
  if(isStart){
    player.jump();
  }else{
    isStart = true;
  }

  if(!notGameOver){
    if(mouseY > 430 && mouseY < 460){
      if(mouseX > 220 && mouseX < 300){
        link("http://twitter.com/share?url=http://potato4d.me/game/The_Jumper&text=The Jumperをプレイ！結果は" + nfc(player.distance, 1)+"m" +"でした。&related=potato4d&hashtags=The_Jumper", "_new");
      }

      if(mouseX > 360 && mouseX < 440){
        restart();
      }
    }
  }
}

void SetDrawScreen(){
  background(255);
  
  fill(0);
  noStroke();
  rect(0, 400, 640, 480);
  
  fill(255);
  textSize(16);
  
  textAlign(LEFT);
  text("The Jumper", 8, height-8);
  textAlign(RIGHT);
  text("(C) Potato4d", width-8, height-8);
}

void showDistance(){
  fill(0);
  textSize(24);
  textAlign(LEFT);
  text("distance:"+nfc(player.distance, 1)+"m", 32, 64);
}

void Spawn(){
  for(int i = 0; i < walls.length; i++){
    if(!walls[i].getExist()){
      walls[i].init(1200+600*count+random(150), HEIGHT[int(random(HEIGHT.length))]);
      count ++;
    }
  }
}

void Collision(){
  for(int i = 0; i < walls.length; i++){
    if(24 > player.distance-walls[i].x+Base && 24 < player.distance-walls[i].x+32+Base){
      if(player.y+24 > 400-walls[i].y){
        notGameOver = false;
      }
    }
  }
}

void restart(){
  count = 0;
  isStart = false;
  notGameOver = true;
  
  player.init(52.0, 4.9);
  
  for(int i = 0; i < walls.length; i++){
    walls[i] = new Wall();
    walls[i].init(1200+600*count+random(150), HEIGHT[int(random(HEIGHT.length))]);
    count ++;
  }
}
