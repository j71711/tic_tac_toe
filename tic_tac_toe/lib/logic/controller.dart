import 'package:tic_tac_toe/logic/board.dart';
import 'package:tic_tac_toe/logic/logic_oprations.dart';
import 'package:tic_tac_toe/logic/palyer.dart';
import 'package:tic_tac_toe/logic/scores.dart';


 class TicTacToeController {
  Board board = Board();
  Player player = Player();
  Score score = Score();
  GameLogic logic = GameLogic();

  /// Reset the game
  /// keepScore =  keep scores (for auto round)
void resetGame({bool keepScore = true}) {
  board = Board();
  player = Player();
  logic.reset();
  if (!keepScore) {
    score.reset(); // Reset scores only when buttun is pressed
  }
}

  void playMove(int index) {
    if (board.box[index] != '' || logic.gameOver) return;

    board.makeMove(index, player.current);
    logic.checkWinner(board, score);

    if (!logic.gameOver) {
      player.switchPlayer();
    }
  }

  void undoMove() {
    if (board.pastMove.isEmpty || logic.gameOver) return;

    board.undoMove();
    player.switchPlayer();
  }
}