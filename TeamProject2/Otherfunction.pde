//gradientCircle function
  void gradientCircle(float x, float y, float r) {
   ellipseMode(RADIUS); 
   for (float i = r; i > 0; i--) {
    noStroke();
    fill(i/r * 255, 20);
    ellipse(x, y, i, i);
   }
  }
  
//instruction box
  void instructionBox() {
   pushMatrix();
   translate(50, 50);
   noStroke();
   
   fill(200, 220);
   rect(0, 0, 750, 650);
   
  // Line down left side of box
  stroke(0);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(0, 0, 0, 650);
  
  fill(0);
  textSize(20);
  text("Character Control: Key left, right, up, down  ", 20, 20);
  text("Stand on the tree and press Key c: Cut the tree  ", 20, 50);
  text("Press craft torch button: Need 3 woods, increase your vision", 20, 80);
  text("Press craft boat button: Need 5 woods, allow you walk on the water", 20, 110);
  text("HealthBar: At left top corner, when becomes zero you will die", 20, 140);
  text("Bonfire: Stand on the bonfire to recover health", 20, 170);
  text("Stand on the treasure: Win the game", 20, 200);
  popMatrix();
  }
