 import 'package:tic_tac_toe/logic/board.dart';
import 'package:tic_tac_toe/logic/scores.dart';

class GameLogic {
  bool gameOver = false;
  List<int> winning = [];

  void checkWinner(Board board, Score score) {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board.box[pattern[0]] != '' &&
          board.box[pattern[0]] == board.box[pattern[1]] &&
          board.box[pattern[1]] == board.box[pattern[2]]) {
        gameOver = true;
        winning = pattern;
        score.addWin(board.box[pattern[0]]);
        return;
      }
    }

    if (board.isFull()) {
      gameOver = true;
      score.addDraw();
    }
  }

  void reset() {
    gameOver = false;
    winning = [];
  }
}



