SudokuGame engine;

int[][] displayBoard;
int [][] fullBoard;
int cellSize = 60;

int selectedRow = -1;
int selectedCol = -1;
int selectedNumber = 1;

void setup() {
  size(540, 640); // 9 cells * 60px
  engine = new SudokuGame();
  
  fullBoard = engine.createBoard();
  displayBoard = new int[9][9];
  

  
  engine.copyBoard(displayBoard, fullBoard);
  engine.hardBoard(displayBoard);
}

void draw() {
  background(255);
  highlightSelected();
  drawGrid();
  drawNumbers();
  displayNumbers();
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
    if(i == selectedNumber){
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
      int clicked = int(mouseX/ (width/9.0)) +1;
      if(selectedNumber == clicked){
        selectedNumber = 0;
      }
      else{
        selectedNumber = clicked;
        if(selectedRow != -1 && selectedCol != -1){
          if (fullBoard[selectedRow][selectedCol] == selectedNumber) {
            displayBoard[selectedRow][selectedCol] = selectedNumber;
            selectedRow = -1;
            selectedCol = -1;
          }
        }
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
