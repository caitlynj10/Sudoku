SudokuGame engine;

int[][] displayBoard;
int [][] fullBoard;
int cellSize = 60;

int selectedRow = -1;
int selectedCol = -1;
int selectedNumber = 1;
boolean gameStarted = false;
boolean gameWon = true;
String difficulty = "";



void setup() {
  size(540, 640); // 9 cells * 60px
  engine = new SudokuGame();
  
  fullBoard = engine.createBoard();
  displayBoard = new int[9][9];
  difficulty = "easy";
  
  engine.copyBoard(displayBoard, fullBoard);
  engine.easyBoard(displayBoard);
  
}

void draw() {
  if(gameWon){
    gameEnded();
  }
  else if(!gameStarted){
    startGame();
  }
  else{
    background(255);
    highlightSelected();
    drawGrid();
    drawNumbers();
    displayNumbers();
  }
 
}

void startGame(){

  background(255, 199, 189);

  textAlign(CENTER, TOP);
  textSize(40);
  text("Play Sudoku", width/2, 50);
  fill(255, 105, 186);
  rect(170, 240, 200, 100, 28);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("Start Game", 270, 290);

  if(difficulty.equals("easy")){
    fill(107, 17, 0);
  }
  else{
    fill(255, 105, 186);
  }
  rect(70, 400, 100, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Easy", 120, 425);

  if(difficulty.equals("medium")){
    fill(107, 17, 0);
  }
  else{
    fill(255, 105, 186);
  }
  rect(220, 400, 100, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Medium", 270, 425);

  if(difficulty.equals("hard")){
    fill(107, 17, 0);
  }
  else{
    fill(255, 105, 186);
  }
  rect(370, 400, 100, 50);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Hard", 420, 425);
 
}

void gameEnded(){
  background(97, 255, 110);
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(0);
  text("Puzzle Complete!", width/2, 280);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Press Enter to Play Again", width/2, 320);
}

void setGameDifficulty(int [][] board){
  
  if(mouseX > 70 && mouseX < 170 && mouseY > 400 && mouseY < 450){
    engine.copyBoard(board, fullBoard);
    difficulty = "easy";
    engine.easyBoard(board);
  }
  else if(mouseX > 220 && mouseX < 320 && mouseY > 400 && mouseY < 450){
    engine.copyBoard(board, fullBoard);
    difficulty = "medium";
    engine.mediumBoard(board);
  }
  else if(mouseX > 370 && mouseX < 470 && mouseY > 400 && mouseY < 450){
    engine.copyBoard(board, fullBoard);
    difficulty = "hard";
    engine.hardBoard(board);
  }
  
}

void drawGrid() {
  stroke(0);
  for (int i = 0; i <= 9; i++) {
    if (i % 3 == 0) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    line(i * cellSize, 0, i * cellSize, 540);
    line(0, i * cellSize, width, i * cellSize);
  }
}

void drawNumbers() {
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(0);
  
  for (int row = 0; row < 9; row++) {
    for (int col = 0; col < 9; col++) {
      int value = displayBoard[row][col];
      if (value != 0) {
        text(value, col * cellSize + cellSize/2, row * cellSize + cellSize/2);
      }
    }
  }
}

void displayNumbers(){
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(0);

  float displayY = 590;
  float itemWidth = width / 9.0;

  for (int i = 1; i <= 9; i++) {
    float x = (i - 1) * itemWidth + itemWidth / 2;
    boolean isHovering = mouseX > (i - 1) * itemWidth && mouseX < i * itemWidth && mouseY > 560 && mouseY < 620;
    if(mousePressed && isHovering){
      fill(200,200,255);
      noStroke();
      rect((i - 1) * itemWidth + 5, displayY - 25, itemWidth - 10, 50);
    }
    
    fill(0); 
    text(i, x, displayY);
    
    noFill();
    stroke(0);
    strokeWeight(1);
    rect((i - 1) * itemWidth + 5, displayY - 25, itemWidth - 10, 50);
  }
  
}

void mousePressed() {

  if(!gameStarted){
    setGameDifficulty(displayBoard);

    if(mouseX > 170 && mouseX < 370 && mouseY > 240 && mouseY < 340){
      gameStarted = true;
    }
  }

  if (mouseY < 540) {
    int r = mouseY / cellSize;
    int c = mouseX / cellSize;
    if (r >= 0 && r < 9 && c >= 0 && c < 9) {
      if(displayBoard[r][c] == 0){
        if (r == selectedRow && c == selectedCol) {
          selectedRow = -1;
          selectedCol = -1;
        } 
        else {
          selectedRow = r;
          selectedCol = c;
        }
      }
      
     }
  } 

  else if(mouseY>560 && mouseY<620){
    if(mouseX >= 0 && mouseX < width){
      int clicked = int(mouseX / (width / 9.0)) + 1;  
      
      if(selectedRow != -1 && selectedCol != -1){
        if (fullBoard[selectedRow][selectedCol] == clicked) {
          displayBoard[selectedRow][selectedCol] = clicked;
          selectedRow = -1;
          selectedCol = -1;
            
          if(engine.completedBoard(displayBoard,fullBoard)){
            gameWon = true;
          }
        }
      }
      
    }
 
  }
}

void keyPressed(){
  if(gameWon && key == ENTER){
    gameWon = false;
    gameStarted = false;
    selectedRow = -1;
    selectedCol = -1;
    fullBoard = engine.createBoard();
    engine.copyBoard(displayBoard, fullBoard);
    difficulty = "easy";
    engine.easyBoard(displayBoard);

  }
  if (key >= '1' && key <= '9') {
    selectedNumber = key - '0';
    if(selectedRow != -1 && selectedCol != -1){
      if (fullBoard[selectedRow][selectedCol] == selectedNumber) {
        displayBoard[selectedRow][selectedCol] = selectedNumber;
        selectedRow = -1;
        selectedCol = -1;
      }
    }
  }
}

void highlightSelected() {
  if (selectedRow != -1 && selectedCol != -1) {
    fill(214);
    noStroke();
    rect(selectedCol* cellSize, selectedRow * cellSize, cellSize, cellSize);
  }
}
