class Map {
  final int rows = 120;
  final int cols = 142;
  int w;
  int h;
  final int distScreen = 0;
  int classLevel_J;
  color theWayThroughTheMazeColor;
  int[][] cells = new int[rows][cols];
  
  // constructor
  Map() {
    w = 40; 
    h = 40; 

    classLevel_J = 0;
    theWayThroughTheMazeColor = color (205); // white 

    cells = new int[rows][cols];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        cells[i][j]= 0;
      } 
    }

    switch (levelCount) {
    case 0:
      defineMazeLevel0 () ;
      break;    
    default:
      println ("Level missing");
      exit();
      break;
    }
  }

  void drawMaze () {
    noStroke();   

    int x=0;
    int y=0; 

    for (int i = viewPort.lowerBoundCurrentX; i < viewPort.upperBoundCurrentX; i++ ) {
      y=0;
      for (int j = viewPort.lowerBoundCurrentY; j < viewPort.upperBoundCurrentY; j++ ) {

        // draw depending on the cell type 
        switch(cells[i][j]) {
        case emptyCell:
          // empty
          fill(theWayThroughTheMazeColor);
          rect(x*w+distScreen, y*h+distScreen, w, h );
          break;
        case brushCell:
          // solid wall
          //image(treeborder,x*w+distScreen, y*h+distScreen, w, h );
          image(brush,x*w+distScreen, y*h+distScreen, w, h );
          break;
        case wallCell:
          // rock
          //image(stone,x*w+distScreen, y*h+distScreen, w, h );
          image(treeborder,x*w+distScreen, y*h+distScreen, w, h );
          noStroke();
          break;        
        case waterCell:
          // water
          fill(30,144,255);
          rect(x*w+distScreen, y*h+distScreen, w, h );
          break; 
        case supplyCell:
          fill(0);
          image(supply,x*w+distScreen, y*h+distScreen, w, h );
          break; 
        case TreeCell:
          image(tree,x*w+distScreen, y*h+distScreen, w, h );
          break; 
        case treasureCell:
          image(treasure,x*w+distScreen, y*h+distScreen, w, h );
          break;
        default:
          println("Undefined cell type. Error 63 with " + 
            cells[i][j] + ".");
          break;
        }

        y++;
      }
      x++;
    }
  }

  void fillMaze ( String theContent ) {
    for (int i = 0; i < theContent.length(); i++) {
      cells[i][classLevel_J] = theContent.charAt(i) - 48;
    }
    classLevel_J++;
  }
// line 157
  private void defineMazeLevel0 () {
    fillMaze( "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"); 
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333331111111111111111111111111111111111111111111111111111111111111111111111111333333331");
    fillMaze( "1333333331055020000000000000002000000000000000000000000000000000000000333333333331333333331");
    fillMaze( "1333333331000222222220222222222222222022222222222222222222222222222222333333333331333333331");
    fillMaze( "1333333331200220000000000000000200000000000020000000000000000000000002330006000331333333331");
    fillMaze( "1333333331202220222222022222220222220222022222222222222022222222222222330000000331333333331");
    fillMaze( "1333333331202000000000000000020000000000000222222222222022222222222222330000000331333333331");
    fillMaze( "1333333331202222222222222222220222222222220000000000000000000000000002333333333331333333331");
    fillMaze( "1333333331000000000000000000000222222222222222222222222222222222222222222222222221333333331");
    fillMaze( "1333333331022222222222222222222200000002200020020002000200000000000200233333333331333333331");
    fillMaze( "1333333331020000000200000000000202222200002020000200020252222222220200230005500031333333331");
    fillMaze( "1333333331022222220222222222220202500002202000222222220222222222220200230000000031333333331");
    fillMaze( "1333333331000000000000000000000202222202002020000000000000000000000000233000000331333333331");
    fillMaze( "1333333331022222022222222222222200000202022220222222220222220222222220233000000331333333331");
    fillMaze( "1333333331020002000200020200000002020002000000000000000020000000000020233000000331333333331");
    fillMaze( "1333333331000200020002020202222222022222022222222222222020222222022220000000000001333333331");
    fillMaze( "1333333331022222222222220202000000000002020000000000000020000002000020222222222221333333331");
    fillMaze( "1333333331020002000000000200022222222202020222222222202022222222222020222222222221333333331");
    fillMaze( "1333333331000200020222222222220000000002020000000000202020000000000020222222222221333333331");
    fillMaze( "1333333331022222220222222222220222222222022222222222202022222202222220222222222221333333331");
    fillMaze( "1333333331000000020200000000020000000002000000000000002020000000000000000000000001333333331");
    fillMaze( "1333333331220222220202222222220222222222022222222222222020222222222222222222222201333333331");
    fillMaze( "1333333331020200000200000000020200000000000000002000002020000000002000000000005201333333331");
    fillMaze( "1333333331020202020222222222020222022222222222222202202022202222222022222222222201333333331");
    fillMaze( "1333333331020222020200000000020000000000000000000002002020000000000000000000000001333333331");
    fillMaze( "1333333331000000020202222222222222222222222222222222222022222222222202222222222221333333331");
    fillMaze( "1333333331022222222200002000200020000000000000000000052520000000000000000000000001333333331");
    fillMaze( "1333333331020220000200200020002000202222222222222222222022222222222222222222222201333333331");
    fillMaze( "1333333331020220222222202022222222202000000000000000000000000000000000000000000001333333331");
    fillMaze( "1333333331020220200000222220000000202222222222222222222022222222222222222222222221333333331");
    fillMaze( "1333333331020220250000000000222222202000000000000000000000000000000000000000000001333333331");
    fillMaze( "1333333331020220200000202222200000202222222222222222202222222222222222222222222221333333331");
    fillMaze( "1333333331020220222222200000202222202000000000000000000000000000000000000000000001333333331");
    fillMaze( "1333333331020220000020202220002020002222220222222222222222222222222222222220222221333333331");
    fillMaze( "1333333331020222222020202020202020222000000000000000000000000000000000000000000001333333331");
    fillMaze( "1333333331020020000020202020202020202222222222222222222222022222222222222222222221333333331");
    fillMaze( "1333333331022020222220202020200020202000000000200020000020002000000000200000000001333333331");
    fillMaze( "1333333331022020000020202020202020202020222022202020202020202022202220200202000001333333331");
    fillMaze( "1333333331022022222020202020222020202020202020002020202020202020000020222202222221333333331");
    fillMaze( "1333333331022020200020002022222220202000200022202000202000200020050020000000000001333333331");
    fillMaze( "1333333331000020202222200000000220202222222222222222222202222222222222222022222221333333331");
    fillMaze( "1333333331020220202000202222220200202000000000000000000000020200000000000020000001333333331");
    fillMaze( "1333333331020220002020000000020202202222222222222022222222020202222222222020202221333333331");
    fillMaze( "1333333331020020202022222222220000000002000000000000000000020202000000002022200001333333331");
    fillMaze( "1333333331022020202020000000000002020202022222222022222022020222022202202000202221333333331");
    fillMaze( "1333333331020020202220222222222222020202020000000000000002020000020200202220200001333333331");
    fillMaze( "1333333331020222202020200000000002000202020220220222222202020222220202200020202201333333331");
    fillMaze( "1333333331020020202020202022222222222202020200420200020202220200000202222020200201333333331");
    fillMaze( "1333333331022020202020202020000002020202020000000202020200000202222200202020222201333333331");
    fillMaze( "1333333331020020002000002020222202000202020200020202020222222200000000202000000001333333331");
    fillMaze( "1333333331020220202222222220255202020202000220220202020000000222220222202222222221333333331");
    fillMaze( "1333333331020020202000000020200002020000020000000002020000000000000000000000000001333333331");
    fillMaze( "1333333331002020202022222020222222020202222222222222022202222222220222222222222201333333331");
    fillMaze( "1333333331202020202020000000000000020202000000000002020000000000000000000000000201333333331");
    fillMaze( "1333333331202020202022222222222222020202022222222202020222222222222222222222222201333333331");
    fillMaze( "1333333331222020202000000000000002020202020000000202020200000000000000000000020201333333331");
    fillMaze( "1333333331202020202222222222222222222202220222220202020222220222222222222222020001333333331");
    fillMaze( "1333333331202020200000000000000000000200000200020202020200000000000000000002022221333333331");
    fillMaze( "1333333331202022222222222202222222222202022202020202000222222222222222222202000001333333331");
    fillMaze( "1333333331202000000000020000000000000000000002020202020000000000000000000202222201333333331");
    fillMaze( "1333333331202022222222022222222222222202022022020202020222220222222222220202000201333333331");
    fillMaze( "1333333331200000000002000000000000000200020002020202022200000200000200020200020201333333331");
    fillMaze( "1333333331222222222202222222222222222202020202020202000002220252020202220222220201333333331");
    fillMaze( "1333333331000000000200000000000000000202020202020202222222020222020202000000020201333333331");
    fillMaze( "1333333331222222220222222222222222220202020202020200020000020000020202222222020201333333331");
    fillMaze( "1333333331000000020002000000000000000002022222020222020202022222220200000002020201333333331");
    fillMaze( "1333333331022222222202222022222220222222220000020002220202000000000202222222020221333333331");
    fillMaze( "1333333331020000000200002000000000000000000222222202000202222222222202000000020001333333331");
    fillMaze( "1333333331000222220222202022222222222220200200000202222200020002000202202222022221333333331");
    fillMaze( "1333333331022200020000200000000000000000202222220202000002000200020200000000000001333333331");
    fillMaze( "1333333331020002222220202022222222222220202022020202222222222222222222222022222221333333331");
    fillMaze( "1333333331020200000000202000000000000020202000020200000000000000000000002020220001333333331");
    fillMaze( "1333333331022222222222202022222222222020002020220222222222022222222222202000220221333333331");
    fillMaze( "1333333331000000000000002020000000002020202020020000200002022000000000202022220201333333331");
    fillMaze( "1333333331020222220222222020222022222020202220222222202222020022220222202220000001333333331");
    fillMaze( "1333333331020200020200000020020000002020200000000000000002020220220000200000222201333333331");
    fillMaze( "1333333331020202020202222222022222222020222222220222222222020020222220222222200201333333331");
    fillMaze( "1333333331020202020200000052000000000020002000023333333332022020200020000000000201333333331");
    fillMaze( "1333333331020202020222222222022222222222202022023000000032020020202020222222220201333333331");
    fillMaze( "1333333331020222020000200000000000000000002022023004500032020220202020200000520201333333331");
    fillMaze( "1333333331020000022222202222222222222022202022023000003332020000202020222202220201333333331");
    fillMaze( "1333333331022222020000000000000000002020002022023000003222022220202020200000000201333333331");
    fillMaze( "1333333331000000020222222222222222202000202022003333333200000020202022222222222201333333331");
    fillMaze( "1333333331022222020200000000000000202022222222202222222222022020202000000202000201333333331");
    fillMaze( "1333333331020002020220222222220222202020000000000000000202022020222222220200020201333333331");
    fillMaze( "1333333331020202020220000000020200002020222222222222222202022020000000022222022201333333331");
    fillMaze( "1333333331020202020222222222020222222020000000000000000000022022222222000000000001333333331");
    fillMaze( "1333333331020202020200000002020000000022222222222022202222022002000202222222222221333333331");
    fillMaze( "1333333331333333333333333333333332222220000000002022202022022222020202222222222221333333331");
    fillMaze( "1333333331333333333333333333333333000000222222202000002022000000020002233333333331333333331");
    fillMaze( "1333333331333333333000333333333333302222200000202222022022022022222202233333333331333333331");
    fillMaze( "1333333331333333330050033333333333332222222220202000000022022020000202233000000001333333331");
    fillMaze( "1333333331333333333000333333333333333000000020000020202022022020220222233000000001333333331");
    fillMaze( "1333333331333333333333333333333333333322222220222222222222000020200002233000000001333333331");
    fillMaze( "1333333331333333333333333333333333333330000000000000000000022000200552233000000001333333331");
    fillMaze( "1333333331111111111111111111111111111111111111111111111111111111111111111111111111333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331");
    fillMaze( "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111");


    println ("------------------------- done ------------------------------");
  }
 
}