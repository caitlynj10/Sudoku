class SudokuGame{
    
    public int[][] createBoard(){
        int [][] board = new int[9][9];
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                board[i][j] = (int)(Math.random() * 10);
            }
        }
        return board;
    }

    public void printBoard(int[][] board){  
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                System.out.print(board[i][j] + " ");
            }
            System.out.println();   
        }

    }
    public boolean checkRows(int[] row) {
        
        return true;
    }

    public boolean checkColumns(int[] col){

        return true;
    }

    public boolean checkSquare(int[][] board){

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