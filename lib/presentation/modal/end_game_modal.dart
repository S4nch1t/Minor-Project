import 'package:flutter/material.dart';

class EndGameModal extends StatelessWidget {
  final VoidCallback? onRetry;
  final VoidCallback? onChangeDifficulty;

  const EndGameModal({
    this.onRetry,
    this.onChangeDifficulty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
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
            TextButton(
              onPressed: onChangeDifficulty,
              child: const Text(
                'Restart',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "press start2p regular",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
