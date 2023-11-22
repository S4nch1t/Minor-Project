import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class EndGameModal extends StatelessWidget {
  final VoidCallback? onRetry;

  const EndGameModal({
    this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Game Finished",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "press start2p regular",
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: onRetry,
            iconSize: 50,
            icon: const Icon(
              CommunityMaterialIcons.restart,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
