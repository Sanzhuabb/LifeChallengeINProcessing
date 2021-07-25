void keyPressed() {

  switch (screenState) {

  case gameState:
    keyPressedForStatePlay();
    break;

  default:
    break;
  }
  if (key == 'c' || key == 'C') {
     if(viewPort.current == 5){
       player.cutTree();
     }
    }
}

void keyPressedForStatePlay() {
  // player stops before screen borders  
  int innerDistance = 48; 
  
  // if special key
  if (key == CODED) {

    if (keyCode == UP) {
      if (player.PlayerY>height/2)
      {
        player.PlayerY-=player.speed;
      }
      else if ( ! viewPort.moveUp() ) {
        if (player.PlayerY>innerDistance) {
          player.speed = 0;
        }
      }
    }

    else if (keyCode == DOWN) {
      if (player.PlayerY<height/2)
      {
        player.PlayerY+=player.speed;
      }
      else if ( ! viewPort.moveDown() ) {
        if (player.PlayerY<height-innerDistance) {
          player.speed = 0;
        }
      }
    }

    else if (keyCode == RIGHT) {
      if (player.PlayerX<width/2)
      {
        // move him 
        player.PlayerX+=player.speed;
      }
      else if ( ! viewPort.moveRight() ) {
        if (player.PlayerX<width-innerDistance) {
          player.speed = 0;
        }
      }
    }
    
    else if (keyCode == LEFT) {
      if (player.PlayerX>width/2)
      {
        player.PlayerX-=player.speed;
      }
      else if ( ! viewPort.moveLeft() ) {
        if (player.PlayerX>innerDistance) { 
          player.speed = 0;
        }
      }
    }
    
  }
}
