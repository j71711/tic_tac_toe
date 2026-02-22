class Player {
  String current;

  Player() : current = 'X';

  void switchPlayer() {
    current = current == 'X' ? 'O' : 'X';
  }
}