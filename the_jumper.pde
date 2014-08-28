Player player = new Player();
Wall[] walls  = new Wall[4];

int count = 0;
final float Base = 128;

PImage Logo = new PImage();
boolean isStart    = false;
boolean notGameOver = true;
float[] HEIGHT = {64, 96, 160, 128, 222, 222};

void setup(){
  size(640, 480);
  
  background(255);
  
  fill(0);
  noStroke();
  rect(0, 400, 640, 480);
  
  player.init(52.0);
  Logo = loadImage("Logo.png");
  
  for(int i=0; i<walls.length; i++){
    walls[i] = new Wall();
    walls[i].init(1200+600*count+random(150), HEIGHT[int(random(HEIGHT.length))]);
    count ++;
  }
  
  frameRate(60);
}

void draw(){
  if(notGameOver){
    if(isStart){
      game();
    }else{
      top();
    }
  }else{
    //gameover();
  }
}

void top(){
  SetDrawScreen();
  image(Logo, 300 - Logo.width/2, 0);
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("Press Start", width/2, 380);
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
  textSize(32);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2+16);

  fill(255, 0, 0);
  textSize(16);
  text("Distance:"+nfc(player.distance, 1)+"m", width/2, height/2+32);
}


void mouseClicked(){
  if(isStart){
    player.jump();
  }else{
    isStart = true;
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
  for(int i=0; i<walls.length; i++){
    if(!walls[i].getExist()){
      walls[i].init(1200+600*count+random(150), HEIGHT[int(random(HEIGHT.length))]);
      count ++;
    }
  }
}

void Collision(){
  for(int i=0; i<walls.length; i++){
    if(24 > player.distance-walls[i].x+Base && 24 < player.distance-walls[i].x+32+Base){
      if(player.y+24 > 400-walls[i].y){
        notGameOver = false;
      }
    }
  }
}
