SudokuGame engine;
int[][] displayBoard;
int cellSize = 60;

void setup() {
  size(540, 540); // 9 cells * 60px
  engine = new SudokuGame();
  
  // Generate a new board using your logic
  int[][] fullBoard = engine.createBoard();
  displayBoard = new int[9][9];
  
  // Use your copy and puzzle methods
  engine.copyBoard(displayBoard, fullBoard);
  engine.puzzleBoard(displayBoard);
}

void draw() {
  background(255);
  drawGrid();
  drawNumbers();
}

void drawGrid() {
  stroke(0);
  for (int i = 0; i <= 9; i++) {
    // Draw thicker lines for 3x3 boundaries
    if (i % 3 == 0) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    line(i * cellSize, 0, i * cellSize, height);
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
        // Center the text in the cell
        text(value, col * cellSize + cellSize/2, row * cellSize + cellSize/2);
      }
    }
  }
}
