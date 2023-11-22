import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MenuModal extends StatelessWidget {
  final VoidCallback? onStart;

  const MenuModal({
    this.onStart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onStart,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
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
                "",
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
