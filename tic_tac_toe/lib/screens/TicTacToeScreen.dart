 import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/core/buildIconButton.dart';
import 'package:tic_tac_toe/logic/controller.dart';
import 'package:tic_tac_toe/logic/scoreCoulmn.dart';



class TicTacToeScreen extends StatefulWidget {
final VoidCallback changeTheme;
const TicTacToeScreen({super.key, required this.changeTheme});
@override
 State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  final TicTacToeController controller = TicTacToeController();

  void playMove(int index) {
    setState(() {
      controller.playMove(index);
    });
  }

  void undoMove() {
    setState(() {
      controller.undoMove();
    });
  }

  void resetGame() {
    setState(() {
      controller.resetGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? const [
                        Color(0xFF0F0C29),
                        Color(0xFF302B63),
                        Color(0xFF24243E),
                      ]
                    : const [Color(0xFFB993D6), Color(0xFF8CA6DB)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  /// Top Row: Title + Undo + Reset + Theme
                Row(
  children: [
    const Text(
      "Tic Tac Toe",
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Spacer(),

    buildIconButton(Icons.undo, undoMove),

    buildIconButton(Icons.refresh, () {
      setState(() {
        controller.resetGame(keepScore: false);
      });
    }),

    buildIconButton(
      isDark ? Icons.dark_mode : Icons.light_mode,
      widget.changeTheme,
    ),
  ],
),

                  const SizedBox(height: 20),

                  /// Score Board
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .10),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        scoreColumn(
                          "Player X",
                          controller.score.xScore,
                          Colors.cyanAccent,
                        ),
                        scoreColumn(
                          "Draws",
                          controller.score.draws,
                          Colors.white70,
                        ),
                        scoreColumn(
                          "Player O",
                          controller.score.oScore,
                          Colors.pinkAccent,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Player 1 vs Player 2 with color
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Player 1 Container (X)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 24,
                        ),
                        constraints:
                            const BoxConstraints(minWidth: 140, maxHeight: 140),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .15),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: controller.logic.gameOver &&
                                  controller.logic.winning.isNotEmpty &&
                                  controller.board
                                          .box[controller.logic.winning[0]] ==
                                      'X'
                              ? [
                                  BoxShadow(
                                    color: Colors.cyanAccent.withValues(alpha: .10),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                  ),
                                ]
                              : [],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Player 1",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "X",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
SizedBox(width: 12,),
                      /// VS Text
                      const Text(
                        "VS",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
SizedBox(width: 12,),
                      /// Player 2 Container (O)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 24,
                        ),
                        constraints:
                            const BoxConstraints(minWidth: 140, maxHeight: 140),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .15),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: controller.logic.gameOver &&
                                  controller.logic.winning.isNotEmpty &&
                                  controller.board
                                          .box[controller.logic.winning[0]] ==
                                      'O'
                              ? [
                                  BoxShadow(
                                    color: Colors.pinkAccent.withValues(alpha: .7),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                  ),
                                ]
                              : [],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              "Player 2",
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "O",
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// Game Board
                  Expanded(
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        final isWinning = controller.logic.winning
                            .contains(index);
                        return GestureDetector(
                          onTap: () => playMove(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: .06),
                              borderRadius: BorderRadius.circular(16),
                              border: isWinning
                                  ? Border.all(
                                      color: Colors.greenAccent, width: 3)
                                  : null,
                              boxShadow: isWinning
                                  ? [
                                      BoxShadow(
                                        color: Colors.greenAccent
                                            .withValues(alpha: .6),
                                        blurRadius: 12,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                controller.board.box[index],
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: controller.board.box[index] == 'X'
                                      ? Colors.cyanAccent
                                      : Colors.pinkAccent,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          /// Confetti + Winner Overlay
          if (controller.logic.gameOver &&
              controller.logic.winning.isNotEmpty)
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: .5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      " Player ${controller.board.box[controller.logic.winning[0]]} Wins!",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Lottie.asset(
                      "assets/lottie/Confeti.json",
                      height: 400,
                      repeat: false,
                    ),
                    const SizedBox(height: 16),
                   
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          controller.resetGame();
                        });
                      },
                      child: const Text("Play Again"),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}