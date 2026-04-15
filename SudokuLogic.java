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

    public void  easyBoard(int[][] board){
        Random rand = new Random();
        for(int i = 0; i < board.length; i++){
            int removeNums = rand.nextInt(2) + 3;
            removeFromRow(board, i, removeNums);
        }
    
    }

    public void mediumBoard(int[][] board){
        Random rand = new Random();
        for(int i = 0; i < board.length; i++){
            int removeNums = rand.nextInt(3) + 4;
            removeFromRow(board, i, removeNums);
        }
    

    }

    public void hardBoard(int[][] board){
        Random rand = new Random();
        for(int i = 0; i < board.length; i++){
            int removeNums = rand.nextInt(2) + 6;
            removeFromRow(board, i, removeNums);
        }
    

    }

    public void removeFromRow(int[][] board, int row, int countVals){
        Random rand = new Random();
        int removedVals = 0;
        while(removedVals < countVals){
            int col = rand.nextInt(9);
            if(board[row][col] != 0){
                board[row][col] = 0;
                removedVals++;
            }
        }

    }
        
    
    public int[][] puzzleBoard(int [][] board){
        
        for(int i = 0; i < board.length; i+=6){
            for(int j = 0; j < board[i].length; j+=6){
                board[i][j] = 0;
            }
        }
        return board;


    }

    public void copyBoard(int [][] a, int [][] b){
        for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
                a[r][c] = b[r][c];
            }
        }
    }

    public boolean completedBoard(int[][] empty, int[][]  complete){
        for(int i = 0; i < empty.length; i++){
            for(int j = 0; j < empty[i].length; j++){
                if(empty[i][j] != complete[i][j]){
                    return false;
                }
            }
        }
        return true;
    }

    
    public void playGame(){
        int[][] board = createBoard();
        int [][] filledBoard = new int[9][9];
        copyBoard(filledBoard, board);
        int [][] puzzleBoard = puzzleBoard(board); 
        System.out.println("Complete Board");
        printBoard(filledBoard);
        System.out.println("Puzzle Board");
        printBoard(puzzleBoard);
        Scanner scan = new Scanner(System.in);
        while(!completedBoard(puzzleBoard, filledBoard)){
            System.out.print("Enter row: ");
            int row = scan.nextInt();
            System.out.print("Enter column: ");
            int col = scan.nextInt();
            System.out.print("Enter number: ");
            int num = scan.nextInt();
            if(filledBoard[row][col] == num){
                System.out.println("Correct");
                puzzleBoard[row][col] = num;
                printBoard(puzzleBoard);
            }
            else{
                System.out.println("Incorrect");
            }
        }
        System.out.print("Game Complete");
        scan.close();
        
    }

    public static void main(String[] args) {
        System.out.println("Playing Sudoku");
        SudokuGame game = new SudokuGame();
        game.playGame();
        
    }

}