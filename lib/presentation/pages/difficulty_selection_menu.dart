import 'package:flutter/material.dart';
import 'package:memory_game/presentation/pages/game_view.dart';

class DifficultySelectionMenu extends StatefulWidget {
  @override
  _DifficultySelectionMenuState createState() => _DifficultySelectionMenuState();
}

class _DifficultySelectionMenuState extends State<DifficultySelectionMenu> {
  Difficulty? _selectedDifficulty; // Make _selectedDifficulty nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Difficulty'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RadioListTile<Difficulty>(
            title: Text('Easy'),
            value: Difficulty.easy,
            groupValue: _selectedDifficulty,
            onChanged: (Difficulty? value) { // Accept nullable Difficulty
              setState(() {
                _selectedDifficulty = value;
              });
            },
          ),
          RadioListTile<Difficulty>(
            title: Text('Medium'),
            value: Difficulty.medium,
            groupValue: _selectedDifficulty,
            onChanged: (Difficulty? value) { // Accept nullable Difficulty
              setState(() {
                _selectedDifficulty = value;
              });
            },
          ),
          RadioListTile<Difficulty>(
            title: Text('Hard'),
            value: Difficulty.hard,
            groupValue: _selectedDifficulty,
            onChanged: (Difficulty? value) { // Accept nullable Difficulty
              setState(() {
                _selectedDifficulty = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_selectedDifficulty != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameView(difficulty: _selectedDifficulty!),
                  ),
                );
              }
            },
            child: Text('Start Game'),
          ),
        ],
      ),
    );
  }
}
