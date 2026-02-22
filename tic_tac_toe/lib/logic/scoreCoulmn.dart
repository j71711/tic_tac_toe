import 'package:flutter/material.dart';

Widget scoreColumn(String title, int score, Color color) {
  return Column(
    children: [
      Text(
        score.toString(),
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
    ],
  );
}