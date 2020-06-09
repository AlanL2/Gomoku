String state = "display";
boolean won = false;
PImage bg;
ArrayList<Integer>xList = new ArrayList<Integer>(), yList = new ArrayList<Integer>(), prevX = new ArrayList<Integer>();
ArrayList<Integer>prevY = new ArrayList<Integer>();
boolean turn = true; //true is black, false is white
int gridSize = 15, spaces = 780/gridSize;
String[][]board;
void setup(){
  size(1000, 800);
  strokeWeight(3);
  ellipseMode(CENTER);
  bg = loadImage("background.png");
  bg.resize(width, height);
  board = new String[gridSize][gridSize];
  for(int i = 0; i<gridSize; i++){
    for(int j = 0; j<gridSize; j++){
      board[i][j] = "";
    }
  }
  for(int i = 20; i<=(gridSize-1)*spaces+20; i+=spaces){
    for(int j = -10; j<10; j++){
      xList.add(i+j); 
    }
  }
  for(int i = 30; i<=(gridSize-1)*spaces+30; i+=spaces){
    for(int j = -10; j<10; j++){
      yList.add(i+j); 
    }
  }
}
void draw(){
  if(state.equals("display")){
    display();
  }
  else if(state.equals("win")){
    if(won)winScreen(true);
    else winScreen(false);
    if(keyPressed)state = "display";
  }
}
