import 'package:flutter/material.dart';

Widget buildIconButton(IconData icon, VoidCallback onPressed) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.10),
      borderRadius: BorderRadius.circular(12),
     
    ),
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
    ),
  );
}