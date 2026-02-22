class Score {
  int xScore;
  int oScore;
  int draws;

  Score()
      : xScore = 0,
        oScore = 0,
        draws = 0;

  void addWin(String player) {
    if (player == 'X') {
      xScore++;
    } else {
      oScore++;
    }
  }

  void addDraw() {
    draws++;
  }

  void reset() {
    xScore = 0;
    oScore = 0;
    draws = 0;
  }
}