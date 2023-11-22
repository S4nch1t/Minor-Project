import 'package:flutter/cupertino.dart';

class FigureEntity {
  String id;
  IconData icon;
  bool enable;
  bool isFinded;

  FigureEntity({
    required this.id,
    required this.icon,
    this.enable = false,
    this.isFinded = false,
  });
}
