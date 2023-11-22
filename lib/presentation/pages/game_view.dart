import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/core/constants.dart';
import 'package:memory_game/presentation/controller/game_controller.dart';
import 'package:memory_game/presentation/modal/end_game_modal.dart';
import 'package:memory_game/presentation/modal/menu_modal.dart';
import 'package:memory_game/presentation/widgets/figure_tile.dart';
import 'dart:async';

enum Difficulty {
  easy,
  medium,
  hard,
}

class GameView extends StatefulWidget {
  final GameController controller = GameController();
  final Difficulty difficulty;

  GameView({
    required this.difficulty,
    Key? key,
  }) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late int _secondsRemaining;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = getInitialTime(widget.difficulty);
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel(); // Timer expired, handle game over
        }
      });
    });
  }

  int getInitialTime(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return 60; // Set the time for easy difficulty
      case Difficulty.medium:
        return 45; // Set the time for medium difficulty
      case Difficulty.hard:
        return 30; // Set the time for hard difficulty
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Icon(
                        CommunityMaterialIcons.brain,
                        size: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Recall: Memory Based Card Matching Game",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "press start2p regular",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    constraints: const BoxConstraints(minWidth: 300, maxWidth: 400),
                    height: 410,
                    child: GridView.builder(
                      itemCount: GameConstants.iconsFigure.length * 2,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 115,
                          childAspectRatio: 1,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) => FigureTile(
                          figure: widget.controller.figures.isEmpty
                              ? null
                              : widget.controller.figures[index],
                          onTap: () async {
                            await widget.controller
                                .checkHasSelect(widget.controller.figures[index]);
                            setState(() {});
                            await widget.controller.checkSelecteds();
                            setState(() {});
                            await widget.controller.checkEndGame();
                            setState(() {});
                          }),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.controller.menuInitialActive)
              MenuModal(
                onStart: () {
                  setState(() {
                    widget.controller.startGame();
                  });
                },
              ),
            if (widget.controller.endGame && !widget.controller.menuInitialActive)
              EndGameModal(
                onRetry: () {
                  setState(() {
                    widget.controller.startGame();
                  });
                },
              ),
            Positioned(
              top: 10,
              right: 10,
              child: Text('Time Remaining: $_secondsRemaining seconds'),
            ),
          ],
        ),
      ),
    );
  }
}
