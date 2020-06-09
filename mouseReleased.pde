void mouseReleased(){
  if(state.equals("display")){
    if(xList.contains(mouseX)&&yList.contains(mouseY)&&!won){
      String val = findPoint(mouseX, mouseY);
      println(val);
      String[]split = val.split(" ");
      int x = Integer.parseInt(split[0]), y = Integer.parseInt(split[1]);
      if(board[(x-20)/52][(y-30)/52].equals("")){
        if(turn){
          fill(0);
          stroke(0);
          board[(x-20)/52][(y-30)/52] = "b";
        }
        else{
          stroke(255);
          fill(255);
          board[(x-20)/52][(y-30)/52] = "w";
        }
        ellipse(x, y, 30, 30);
        turn = !turn;
        prevX.add(x); 
        prevY.add(y);
      }
    }
    if(mouseX>800&&mouseX<960&&mouseY>50&&mouseY<150&&prevX.size()>0){
      board[(prevX.get(prevX.size()-1)-20)/52][(prevY.get(prevX.size()-1)-30)/52] = "";
      prevX.remove(prevX.size()-1); prevY.remove(prevY.size()-1);
      turn = !turn;
      won = false;
    }
    if(mouseX>800&&mouseX<960&&mouseY>200&&mouseY<300){
      for(int i = 0; i<gridSize; i++){
        for(int j = 0; j<gridSize; j++){
          board[i][j] = "";
        }
      }
      won = false;
    }
  }
  else if(state.equals("win")){
    state = "display";
  }
}

public String findPoint(int x, int y){
  int x1 = x, y1 = y, min = Integer.MAX_VALUE;
  int spaces = (height-20)/15;
  for(int i = -10; i<10; i++){
    for(int j = -10; j<10; j++){
      if((x+i)%spaces==20&&(y+j)%spaces==30){
        int dis = abs(i)+abs(j);
        if(dis<min){
          min = dis;
          x1 = x+i; 
          y1 = y+j;
        }
      }
    }
  }
  return x1+" "+y1;
}
