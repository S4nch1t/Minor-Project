import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MenuModal extends StatefulWidget {
  final VoidCallback? onStart;

  const MenuModal({
    this.onStart,
    Key? key,
  }) : super(key: key);

  @override
  _MenuModalState createState() => _MenuModalState();
}

class _MenuModalState extends State<MenuModal> {
  int _countdown = 3;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _countdown--;
      });
      if (_countdown > 0) {
        _startCountdown();
      } else {
        // When countdown is complete, start the game
        widget.onStart?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onStart,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  CommunityMaterialIcons.brain,
                  color: Colors.white,
                  size: 100,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Recall: Memory Based Card Matching Game",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: "press start2p regular",
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                _countdown > 0 ? 'Starting in $_countdown seconds...' : '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "press start2p regular",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}