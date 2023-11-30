import 'package:flutter/material.dart';
import 'package:memory_game/presentation/pages/game_view.dart';
import 'package:community_material_icon/community_material_icon.dart';

class DifficultySelectionMenu extends StatefulWidget {
  @override
  _DifficultySelectionMenuState createState() => _DifficultySelectionMenuState();
}

class _DifficultySelectionMenuState extends State<DifficultySelectionMenu> {
  Difficulty? _selectedDifficulty; // Make _selectedDifficulty nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(
                  CommunityMaterialIcons.brain,
                  color: Colors.deepPurple,
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Recall: Memory Based Card Matching Game",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 17,
                      fontFamily: "press start2p regular",
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildDifficultyButton(Difficulty.easy),
          _buildDifficultyButton(Difficulty.medium),
          _buildDifficultyButton(Difficulty.hard),
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
            child: Text(
              'Start Game',
              style: TextStyle(
                fontFamily: "press start2p regular",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDifficultyButton(Difficulty difficulty) {
    bool isSelected = _selectedDifficulty == difficulty;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: isSelected ? Colors.white : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedDifficulty = difficulty;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            difficulty.toString().split('.').last,
            style: TextStyle(
              fontFamily: "press start2p regular",
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
