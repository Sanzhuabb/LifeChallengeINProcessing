class Player {
  float PlayerX;
  float PlayerY;
  float HandX;
  float HandY;
  float HandX1;
  float HandY1;
  float speed = 4; 
  float x=0;

  //  constructor 
  Player() {
    PlayerX = width/2;
    PlayerY = height/2;
    HandX = 438;
    HandY = 380;
    HandX1 = 402;
    HandY1 = 380;
  }
  
  void drawPlayer () {
    stroke(255);
    strokeWeight(2);
    //hand
    fill(0, 200);
    ellipse(HandX, HandY, 8, 8);
    ellipse(HandX1, HandY1, 8, 8);
    //body
    fill(0);
    ellipse(PlayerX, PlayerY, 20, 20);
  }
    void carfttroch(){
    if (wood >=3){
    
     for(;x<60;x++){
       rect(PlayerX-30,PlayerY+30,x,5);
      }
      wood = wood -3;
      torch++;
    }
    else {
      fill(255,0,0);
      text("Not enough wood", PlayerX-30,PlayerY-20);
    }
  }
    void cutTree(){
      wood = wood+3;
       for(;x<60;x++){
       rect(PlayerX-30,PlayerY+30,x,5);
      }
      fill(0,0,0);
      text("wood + 3", PlayerX-20,PlayerY+40);
    }
     void carftboat(){
    if (wood >=5){
    
     for(;x<60;x++){
       rect(PlayerX-30,PlayerY+30,x,5);
      }
      wood = wood -5;
      boat++;
    }
    else {
      fill(255,0,0);
      text("Not enough wood", PlayerX-30,PlayerY-20);
    }
  }

} 
 
