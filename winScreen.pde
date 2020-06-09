public void winScreen(boolean gameWon){
  background(bg);
  if(!gameWon){
    text("It's a draw. ", 300, 400);
  }
  else{
    if(!turn){
      textSize(50);
      text("Black wins!", 300, 400);
    }
    else{
      textSize(50);
      text("White wins!", 300, 400);
    }
  }
  won = true;
  textSize(30);
  text("Press any key or the mouse to go back.", 120, 500);
}
