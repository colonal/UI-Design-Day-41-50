import 'package:flutter/material.dart';

import 'pull_bar_widget.dart';
import 'icons_swipe_up_widget.dart';

class BottomBar extends StatelessWidget {
  final bool showSwipeUp;
  const BottomBar({this.showSwipeUp = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 160,
          color: showSwipeUp ? Colors.black : Colors.transparent,
          alignment: Alignment.center,
          child: const PullBarWidget(),
        ),
        if (showSwipeUp) const IconsSwipeUpWidget()
      ],
    );
  }
}
