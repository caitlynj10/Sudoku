import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Sudoku{

    int boardWidth = 600;
    int boardHeight = 600;

    JFrame frame = new JFrame("Sudoku");

    Sudoku(){
        frame.setVisible(true);
        frame.setSize(boardWidth, boardHeight);
        frame.setResizable(false);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLocationRelativeTo(null);
        frame.setLayout(new BorderLayout());

    }


    

    /*

    public static void fillBoard(int [][] board){
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                board[i][j] = 0; // Fill with default value
            }
        }
    }



    public static void printBoard(int [][] board){
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[i].length; j++){
                System.out.print(board[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static boolean checkRows(int [][] board){


        return true;
    }

    public static boolean checkColumns(int [][] board){

        return true;
    }

    public static boolean checkSquare(int [][] board){

        return true;
    }

    public static boolean checkCorrectBoard(int [][] board){

        return true;
    }

    public static void main(String[] args) {
        System.out.println("Welcome to the Game!");
        int [][] board = new int[3][3];
        fillBoard(board);
        printBoard(board);
        // Initialize game components here
        // Start game loop
    }

    */
}