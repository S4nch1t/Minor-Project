import 'package:flutter/material.dart';
import 'package:memory_game/presentation/pages/difficulty_selection_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recall',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: DifficultySelectionMenu(),
    );
  }
}
