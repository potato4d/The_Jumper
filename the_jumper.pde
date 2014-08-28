Player player = new Player();
Wall[] walls  = new Wall[32];

boolean isStart = false;
float[] HEIGHT = {64, 96, 160, 128, 222, 222};

void setup(){
  size(640, 480);
  
  background(255);
  
  fill(0);
  noStroke();
  rect(0, 400, 640, 480);
  
  player.init(52.0);
  
  for(int i=0; i<walls.length; i++){
    walls[i] = new Wall();
    walls[i].init(1200+600*i+random(150), HEIGHT[int(random(HEIGHT.length))] );
  }
}

void draw(){
  if(isStart){
    SetDrawScreen();
    
    player.update();
    player.show();
    
    for(int i=0; i<walls.length; i++){
      walls[i].show(player.distance);
    }
  }else{
    SetDrawScreen();
    
    player.show();
  }
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
}
