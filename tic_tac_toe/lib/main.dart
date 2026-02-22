import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/theme_app.dart';
import 'package:tic_tac_toe/screens/TicTacToeScreen.dart';


void main()  {
 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true; // default theme

  void changeTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: TicTacToeScreen(
        changeTheme: changeTheme,

      ),
    );
  }
}