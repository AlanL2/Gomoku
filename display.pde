void display(){
  background(bg);
  stroke(0);
  for(int i = 0; i<gridSize; i++){
    fill(0);
    line(i*spaces+20, 30, i*spaces+20, height-40);
    line(20, i*spaces+30, 744, i*spaces+30);
  }
  if(mouseX>800&&mouseX<960&&mouseY>50&&mouseY<150){
    fill(0, 191, 255);
    rect(800, 50, 160, 100);
  }
  else{
    fill(255);
    rect(800, 50, 160, 100);
  }
  fill(0);
  stroke(0);
  textSize(30);
  text("Undo", 835, 110);
  
  if(mouseX>800&&mouseX<960&&mouseY>200&&mouseY<300){
    fill(0, 191, 255);
    rect(800, 200, 160, 100);
  }
  else{
    fill(255);
    rect(800, 200, 160, 100);
  }
  fill(0);
  stroke(0);
  textSize(30);
  text("New", 840, 240);
  text("Game", 835, 280);
  
  //fill(255);
  //rect(800, 350, 160, 100);
  fill(0);
  text("Turn: ", 840, 415);
  if(turn){
    fill(0);
    stroke(0);
  }
  else{
    fill(255);
    stroke(255);
  }
  ellipse(875, 480, 50, 50);
  
  for(int i = 0; i<gridSize; i++){
    for(int j = 0; j<gridSize; j++){
      if(board[i][j].equals("b")){
        fill(0);
        stroke(0);
        ellipse(i*spaces+20, j*spaces+30, 30, 30);
      }
      else if(board[i][j].equals("w")){
        fill(255);
        stroke(255);
        ellipse(i*spaces+20, j*spaces+30, 30, 30);
      }
    }
  }
  if(xList.contains(mouseX)&&yList.contains(mouseY)&&!won){
    String[]split = findPoint(mouseX, mouseY).split(" ");
    int x = Integer.parseInt(split[0]), y = Integer.parseInt(split[1]);
    if(board[(x-20)/52][(y-30)/52].equals(""))cursor(HAND);
    else cursor(ARROW);
  }
  else if((mouseX>800&&mouseX<960&&mouseY>200&&mouseY<300)
     || mouseX>800&&mouseX<960&&mouseY>50&&mouseY<150){
     cursor(HAND);
   }
  else cursor(ARROW);
  if(!won){
    boolean gameDrawn = true;
    for(int i = 0; i<gridSize; i++){
      for(int j = 0; j<gridSize; j++){
        if(board[i][j].equals("")){
          gameDrawn = false;
          break;
        }
      }
    }
    if(gameDrawn){
      state = "win";
    }
    for(int i = 0; i<gridSize; i++){
      for(int j = 0; j<gridSize; j++){
        if(i>=4&&board[i][j].equals(board[i-1][j])&&board[i-1][j].equals(board[i-2][j])
          &&board[i-2][j].equals(board[i-3][j])&&board[i-3][j].equals(board[i-4][j])){
          if(!board[i][j].equals("")){
            state = "win";
            won = true;
          }
        }
        if(i<gridSize-4&&board[i][j].equals(board[i+1][j])&&board[i+1][j].equals(board[i+2][j])
          &&board[i+2][j].equals(board[i+3][j])&&board[i+3][j].equals(board[i+4][j])){
          if(!board[i][j].equals("")){
            state = "win";
            won = true;
          }
        }
        if(j>=4&&board[i][j].equals(board[i][j-1])&&board[i][j-1].equals(board[i][j-2])
          &&board[i][j-2].equals(board[i][j-3])&&board[i][j-3].equals(board[i][j-4])){
          if(!board[i][j].equals("")){
            state = "win";
            won = true;
          }
        }
        if(j<gridSize-4&&board[i][j].equals(board[i][j+1])&&board[i][j+1].equals(board[i][j+2])
          &&board[i][j+2].equals(board[i][j+3])&&board[i][j+3].equals(board[i][j+4])){
          if(!board[i][j].equals("")){
            state = "win";
            won = true;
          }
        }
        if(i>=4&&j>=4&&board[i][j].equals(board[i-1][j-1])&&board[i-1][j-1].equals(board[i-2][j-2])
          &&board[i-2][j-2].equals(board[i-3][j-3])&&board[i-3][j-3].equals(board[i-4][j-4])){
          if(!board[i][j].equals("")){
            state = "win";
            won = true;
          }
        }
        if(j>=4&&i<gridSize-4&&board[i][j].equals(board[i+1][j-1])&&board[i+1][j-1].equals(board[i+2][j-2])
          &&board[i+2][j-2].equals(board[i+3][j-3])&&board[i+3][j-3].equals(board[i+4][j-4])){
          if(!board[i][j].equals("")){
            state = "win";
            won = true;
          }
        }
      }
    }
  }
}
