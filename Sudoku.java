import java.util.*;

class SudokuGame{
    
    
    
    public int[][] createBoard(){
        int[][] board = new int[9][9];
        checkValidBoard(board);
    
        return board;
    }

    public boolean checkValidBoard(int[][] board){
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (board[i][j] == 0) { 
                    List<Integer> nums = new ArrayList<>();
                    for (int k = 1; k <= 9; k++) nums.add(k);
                    Collections.shuffle(nums);
                    for (int num : nums) {
                        if (checkRows(num, board, i) && checkColumns(num, board, j) && checkSquare(num, board, i, j)) {
                            board[i][j] = num;
                            if (checkValidBoard(board)) { 
                                return true;
                            }
                            board[i][j] = 0; 
                        }
                    }
                    return false; 
                }
            }
        }

        return true;
    }

    public void printBoard(int[][] board){  
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                System.out.print(board[i][j] + " ");
            }
            System.out.println();   
        }

    }

    public boolean checkRows(int rowVal, int[][] board, int row) {
        for(int i = 0; i<9; i++){
            if(board[row][i] == rowVal){
                return false;
            }
        }
        return true;
    }

    public boolean checkColumns(int colVal, int[][] board, int col){
        for(int j = 0; j<9; j++){
            if(board[j][col] == colVal){
                return false;
            }
        }
        return true;
    }

    
    public boolean checkSquare(int num, int[][] board, int row, int col){
        int startRow = row - (row % 3);
        int startCol = col - (col % 3);
        for(int i = startRow; i < startRow + 3; i++){
            for(int j = startCol; j < startCol + 3; j++){
                if(board[i][j] == num){
                    return false;
                }
            }
                
        }
        

        return true;
    }
    
    
    public boolean fillBoard(){
        return true;
    }

    public static void main(String[] args) {
        System.out.println("Playing Sudoku");
        SudokuGame game = new SudokuGame();
        int[][] board = game.createBoard();
        game.printBoard(board);


    }

}