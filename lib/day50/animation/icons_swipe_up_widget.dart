import 'package:flutter/material.dart';

import 'animation_swipe_up_widget.dart';

class IconsSwipeUpWidget extends StatelessWidget {
  const IconsSwipeUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationSwipeUpWidget(child: _buildSwipeUp()),
        AnimationSwipeUpWidget(child: _buildSwipeUp()),
        AnimationSwipeUpWidget(child: _buildSwipeUp()),
      ],
    );
  }

  Widget _buildSwipeUp() {
    return Transform(
      transform: Matrix4.rotationX(0),
      child: const Icon(
        Icons.keyboard_arrow_up_sharp,
        color: Colors.blueAccent,
        size: 50,
      ),
    );
  }
}
