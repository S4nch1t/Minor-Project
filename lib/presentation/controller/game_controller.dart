import 'package:flutter/cupertino.dart';
import 'package:memory_game/core/constants.dart';
import 'package:memory_game/domain/entities/figure_entity.dart';

class GameController {
  List<FigureEntity> figures = [];
  List<String> figuresSelected = [];
  bool menuInitialActive = true;
  bool endGame = false;

  

  void startGame() {
    if (menuInitialActive) {
      _createBoard();
      menuInitialActive = false;
    }
    _resetBoard();
    _shuffleBoard();
    endGame = false;
  }

  _resetBoard() {
    for (FigureEntity figure in figures) {
      figure.enable = false;
      figure.isFinded = false;
    }
  }

  _shuffleBoard() {
    figures.shuffle();
  }

  _createBoard() {
    for (IconData icon in GameConstants.iconsFigure) {
      final id = icon.hashCode.toString();
      figures.add(
        FigureEntity(
          id: id,
          icon: icon,
        ),
      );

      figures.add(
        FigureEntity(
          id: id,
          icon: icon,
        ),
      );
    }
  }

  _getSelecteds() =>
      figures.where((element) => element.enable && !element.isFinded).toList();

  checkHasSelect(FigureEntity figureTapped) async {
    final selecteds = _getSelecteds();

    if (selecteds.length < 2) {
      figureTapped.enable = true;
    }
  }

  checkEndGame() {
    if (figures.where((element) => !element.isFinded).isEmpty) {
      endGame = true;
    }
  }

  checkSelecteds() async {
    final selecteds = _getSelecteds();
    if (selecteds.length < 2) return;
    final isEquals = selecteds[0].id == selecteds[1].id;

    await Future.delayed(const Duration(milliseconds: 600));
    for (FigureEntity figure in selecteds) {
      figure.enable = isEquals;
      figure.isFinded = isEquals;
    }
  }
}
