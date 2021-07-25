import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//*Answer Route
//
//left3, down2, left2, down1, left2, down14, left2, top2, left16, top2, left7, top10, left1
//top2, right1, top2, left1, top2, right1, top2, left1, top3, left2, top15, right2, top5
//left2, top12, right20, top2, right6, top2, right1, top2, right
//
// Screen States
final int startState = 0;
final int gameState = 1;
final int deadState = 2;
final int winState = 3;
int screenState = startState;
int getTime; 
int wood = 0;
int torch = 0;
int boat = 0;

//game state vision area
int vision = 120;

// the levels 
int levelCount = 0;

// Player 
Player player;

// Map and mapcell
Map map;
final int emptyCell = 0;
final int wallCell = 2;
final int brushCell = 1;
final int waterCell = 3;
final int supplyCell = 4;
final int TreeCell = 5;
final int treasureCell = 6;
int x1 = 35;
int x2 = 85;
int y1 = 46;
int y2 = 96;

// view port 
ViewPort viewPort; 

//Tree image
PImage tree;
PImage brush;
PImage treeborder;
PImage stone;
PImage supply;
PImage torch_icon;
PImage wood_icon;
PImage boat_icon;
PImage treasure;
//Background image
PImage Start;
PImage Win;
PImage Lose;

//timer
private static byte countdown = 80;
private static int seconds, startTime;

//health bar
int r;
int g;
int b;

//AudioPlayer
Minim minim;
AudioPlayer musicStart;
AudioPlayer musicWin;
AudioPlayer musicDie;

void setup () {
  size(840, 760);
  initGame();
  tree = loadImage("tree3.png");
  stone = loadImage("stone.png");
  treeborder = loadImage("tree2.png");
  brush = loadImage("tree1.png");
  torch_icon = loadImage("Torch.png");
  wood_icon = loadImage("wood.png");
  boat_icon = loadImage("boat.png");
  supply = loadImage("Fire.gif");
  treasure = loadImage("treasure.png");
}

void initGame() {
  player = new Player();
  getTime = millis();
  map = new Map();
  viewPort = new ViewPort(0, map.rows, 0, map.cols);
  startTime = millis()/1000 + countdown;
  minim = new Minim(this);
  musicStart = minim.loadFile("Sneaking In.mp3");
  musicWin = minim.loadFile("Win.mp3");
  musicDie = minim.loadFile("Die.mp3");
}

void draw () {
  background(0);
  switch (screenState) {
  case startState:
    startScreen();
    break;
    
  case gameState:
    map.drawMaze() ;
    player.drawPlayer();
    gameScreen();
    break;
    
  case deadState:
    deadScreen();
    break;
    
  case winState:
    winScreen();
    break;
    
  default:
    // shouldn't get here 
    println("Error screenState: " + 
      screenState + 
      ".");
    // exit program  
    exit();
    break;
  }
}

//-------------------------------------0--------------------------------------
//Start Screen
void startScreen(){ 
  //background
  Start = loadImage("Start.png");
  image(Start, 0, 0);
  
  //music
  musicStart.loop();
  
  pushMatrix();
  //title
  //textSize(35);
  //fill(255);
  //text("Find the Treasure", 300, height/4);
  
  //start button
  strokeWeight(3);
  stroke(255);
  noFill();
  rect(385, height/2, 120, 50);
  
  textSize(30);
  fill(255);
  text("START", 397, 415);
  
  //star
  //star.display(100,100,30,30,3);
  popMatrix();
  
  //start button pressed check
  if (dist(444, 405, mouseX, mouseY) < 35) {
   gradientCircle(444, 405, 35);
  }
  if ((dist(444, 405, mouseX, mouseY) < 35) && mousePressed) {
    screenState = 1;
  }
}

//-------------------------------------1--------------------------------------
//Game Screen
void gameScreen(){
  //black border
  pushMatrix();
  noFill();
  stroke(0);
  strokeWeight(2);
  for (int i = 0; i < 450; i++){
    circle(width/2, height/2, vision+i);
  }
  popMatrix();
  
  //toolbox, instruction button, exit button, health bar
  pushMatrix();
  //toolbox
  fill(211,211,211);
  strokeWeight(2);
  stroke(255);
  rect(0,160,160, 440);
  textSize(30);
  fill(0, 102, 153);
  text("x "+ wood, 90, 210); 
  image(wood_icon, 0, 160, width/10, height/10);
  text("x "+ torch, 90, 300); 
  image(torch_icon, 0, 240, width/10, height/10);
  image(boat_icon, 0, 340, width/10, height/10);
  text("x "+ boat, 90, 390); 
  rect(0,420,160, 40);
  fill(0,0,0);
  textSize(18);
  text("Craft Torch ", 40, 440);
  if ((dist(80, 440, mouseX, mouseY) < 30) && mousePressed) {
    player.carfttroch();
  }
   rect(0,500,160, 40);
  fill(0, 102, 153);
  textSize(18);
  text("Craft Boat ", 40, 520);
  
  if ((dist(80, 520, mouseX, mouseY) < 30) && mousePressed) {
    player.carftboat();
  }
  if(torch >=1){
    vision =240;
  }
  
  //instruction
  strokeWeight(3);
  stroke(255);
  noFill();
  rect(710, 10, 120, 40);
  
  textSize(15);
  fill(255);
  text("Instruction", 730, 35);
  
  //exit
  noFill();
  rect(710, 60, 120, 40);
  
  textSize(15);
  fill(255);
  text("Exit", 755, 85);

  //health bar
  seconds = startTime - millis()/1000;
  
  textSize(20);
  fill(255);
  strokeWeight(5);
  text("HP", 10, 40);
  text(seconds, 200, 60);
  strokeWeight(15);
  stroke(r,g,b);
  line(60,32,60+seconds,32);
if (seconds > 100){
    r = 50;
    g = 205;
    b = 50;
  }
  if (seconds <= 100 && seconds > 40){
    r = 255;
    g = 255;
    b = 0;
  }
  if (seconds <= 40 && seconds > 1){
    r = 255;
    g = 0;
    b = 0;
  }
  if (seconds == 0){
    screenState = 2;
    musicStart.pause();
     musicDie.play();
  }
  popMatrix();
  
  //instruction button action
  if (dist(770, 30, mouseX, mouseY) < 30) {
   gradientCircle(770, 30, 30);
  }
  if ((dist(770, 30, mouseX, mouseY) < 30) && mousePressed) {
    instructionBox();
  }
  
  //exit button action
  if (dist(770, 80, mouseX, mouseY) < 30) {
   gradientCircle(770, 80, 30);
  }
  if ((dist(770, 80, mouseX, mouseY) < 30) && mousePressed) {
    exit();
  }
  
  //find the treasure
   if(viewPort.current == 6){
      screenState = 3;
      musicStart.pause();
      musicWin.play();
    }
    
  //eat supply caller 
      if(viewPort.current == 4){
      if(seconds<=195){
       startTime = startTime+5;
      }
    }

}
//-------------------------------------2--------------------------------------
//Dead Screen
void deadScreen(){
  //background
  Lose = loadImage("Lose.png");
  image(Lose, 0, 0);
  
  pushMatrix();
  //title
  //textSize(35);
  //fill(255);
  //text("You Dead", 350, height/4);
  
  //start button
  strokeWeight(3);
  stroke(255);
  noFill();
  rect(350, height/2+25, 120, 50);
  
  textSize(30);
  fill(255);
  text("EXIT", 380, 440);
  popMatrix();
  
  //start button pressed check
  if (dist(415, 430, mouseX, mouseY) < 35) {
   gradientCircle(415, 430, 35);
  }
  if ((dist(415, 430, mouseX, mouseY) < 35) && mousePressed) {
    exit();
  } 
}

//-------------------------------------3--------------------------------------
//Win Screen
void winScreen(){
  //background
  Win =loadImage("Win.png");
  image(Win, 0, 0);
  
  pushMatrix();
  //title
  //textSize(35);
  //fill(255);
  //text("You Win!!", 350, height/4);
  
  //start button
  strokeWeight(3);
  stroke(255);
  noFill();
  rect(300, height/2+50, 120, 50);
  
  textSize(30);
  fill(255);
  text("EXIT", 330, 415+50);
  
  //star
  //star.display(100,100,30,30,3);
  popMatrix();
  
  //start button pressed check
  if (dist(410-45, 405+50, mouseX, mouseY) < 35) {
   gradientCircle(410-45, 405+50, 35);
  }
  if ((dist(410-45, 405+50, mouseX, mouseY) < 35) && mousePressed) {
    exit();
  }
}
