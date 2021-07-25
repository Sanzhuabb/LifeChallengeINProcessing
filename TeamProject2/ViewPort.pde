class ViewPort {
  // the outer borders
  int lowerBoundAbsoluteX;
  int upperBoundAbsoluteX;

  int lowerBoundAbsoluteY;
  int upperBoundAbsoluteY;
  
  // the currecnt viewport
  int lowerBoundCurrentX;
  int upperBoundCurrentX;

  int lowerBoundCurrentY;
  int upperBoundCurrentY;

  // the size of the viewport
  int widthViewPort = 50;
  int heightViewPort = 50;
  
  int top;
  int down;
  int left;
  int right;
  int current;

  // constructor
  ViewPort(int a1, int a2, 
  int b1, int b2) {
    lowerBoundAbsoluteX = a1;
    upperBoundAbsoluteX = a2;

    lowerBoundAbsoluteY = b1;
    upperBoundAbsoluteY = b2;

    // set current view port at center  
    lowerBoundCurrentX = ( (a1+a2) / 2) - widthViewPort / 2;
    upperBoundCurrentX = ( (a1+a2) / 2) + widthViewPort / 2;

    lowerBoundCurrentY = ( (b1+b2) / 2) - heightViewPort / 2;
    upperBoundCurrentY = ( (b1+b2) / 2) + heightViewPort / 2;

  }

  boolean moveLeft() {
    if (lowerBoundCurrentX>lowerBoundAbsoluteX && !(left == 2) && !(left == 1)&&!(left == 3))
    {
      lowerBoundCurrentX--;
      upperBoundCurrentX--;
     //println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
     //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 410;
    player.HandY = 398;
    player.HandX1 = 410;
    player.HandY1 = 362;
      return true;
    }
    else if (lowerBoundCurrentX>lowerBoundAbsoluteX && !(left == 2) && !(left == 1)&&(boat>=1))
    {
      lowerBoundCurrentX--;
      upperBoundCurrentX--;
     
     //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 410;
    player.HandY = 398;
    player.HandX1 = 410;
    player.HandY1 = 362;
      return true;
    }
    else {
      return false;
    }
  }

  boolean moveRight() {
    if (upperBoundCurrentX<upperBoundAbsoluteX && !(right == 2) && !(right == 1)&&!(right == 3))
    {
      lowerBoundCurrentX++;
      upperBoundCurrentX++;
      //println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
      //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 430;
    player.HandY = 398;
    player.HandX1 = 430;
    player.HandY1 = 362;
      return true;
    }
    if (upperBoundCurrentX<upperBoundAbsoluteX && !(right == 2) && !(right == 1)&&(boat>=1))
    {
      lowerBoundCurrentX++;
      upperBoundCurrentX++;
      //println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
      //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 430;
    player.HandY = 398;
    player.HandX1 = 430;
    player.HandY1 = 362;
      return true;
    }
    else {
      return false;
    }
  }

  boolean moveUp() {
    if (lowerBoundCurrentY>lowerBoundAbsoluteY && !(top == 2) && !(top == 1)&&!(top == 3))
    {
      lowerBoundCurrentY--;
      upperBoundCurrentY--;
      //println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
      //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 438;
    player.HandY = 370;
    player.HandX1 = 402;
    player.HandY1 = 370;
      return true;
    }
    else if (lowerBoundCurrentY>lowerBoundAbsoluteY && !(top == 2) && !(top == 1)&&(boat>=1))
    {
      lowerBoundCurrentY--;
      upperBoundCurrentY--;
      //println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
      //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 438;
    player.HandY = 370;
    player.HandX1 = 402;
    player.HandY1 = 370;
      return true;
    }
    else {
      return false;
    }
  }

  boolean moveDown() {
    if (upperBoundCurrentY<upperBoundAbsoluteY && !(down == 2) && !(down == 1)&&!(down == 3))
    {
      lowerBoundCurrentY++;
      upperBoundCurrentY++;
      //println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
      //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 438;
    player.HandY = 390;
    player.HandX1 = 402;
    player.HandY1 = 390;
      return true;
    }
    else if (upperBoundCurrentY<upperBoundAbsoluteY && !(down == 2) && !(down == 1)&&(boat>=1))
    {
      lowerBoundCurrentY++;
      upperBoundCurrentY++;
      //println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
      //println(map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9]);
      positionCaller();
    //hand
    player.HandX = 438;
    player.HandY = 390;
    player.HandX1 = 402;
    player.HandY1 = 390;
      return true;
    }
    else {
      return false;
    }
  }
  
  void positionCaller() {
      left = map.cells[lowerBoundCurrentX+9][lowerBoundCurrentY+9];
      right = map.cells[lowerBoundCurrentX+11][lowerBoundCurrentY+9];
      top = map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+8];
      down = map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+10];
      current = map.cells[lowerBoundCurrentX+10][lowerBoundCurrentY+9];
      println("Current: " + current,"Top: " + top,"Down: " + down,"left: " + left,"Right: " + right);
      println(lowerBoundCurrentX, upperBoundCurrentX, lowerBoundCurrentY, upperBoundCurrentY);
      //println(lowerBoundCurrentX+10,lowerBoundCurrentY+9);
  }

}
