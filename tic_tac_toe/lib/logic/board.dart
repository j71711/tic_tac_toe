class Board {
  List<String> box;
  List<int> pastMove;

  Board()
      : box = List.filled(9, ''),
        pastMove = [];

  void makeMove(int index, String player) {
    box[index] = player;
    pastMove.add(index);
  }

  void undoMove() {
    if (pastMove.isNotEmpty) {
      int lastIndex = pastMove.removeLast();
      box[lastIndex] = '';
    }
  }

  bool isFull() => !box.contains('');
}