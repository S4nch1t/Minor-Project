import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/domain/entities/figure_entity.dart';

class FigureTile extends StatefulWidget {
  final Function()? onTap;
  final FigureEntity? figure;

  const FigureTile({
    required this.figure,
    this.onTap,
    super.key,
  });

  @override
  State<FigureTile> createState() => _FigureTileState();
}

class _FigureTileState extends State<FigureTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(
          8,
        ),
        color: Colors.black,
        child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Icon(
                widget.figure != null && widget.figure!.enable
                    ? widget.figure!.icon
                    : CommunityMaterialIcons.help_circle_outline,
                key: ValueKey(
                    widget.figure != null ? widget.figure!.enable : false),
                size: 50,
                color: widget.figure != null && widget.figure!.enable
                    ? Colors.deepPurple
                    : Colors.black,
              ),
            )),
      ),
    );
  }
}
