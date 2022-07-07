import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day50/home_screen.dart';

import 'bottom_bar.dart';

class SwipeUpWidget extends StatefulWidget {
  const SwipeUpWidget({Key? key}) : super(key: key);

  @override
  State<SwipeUpWidget> createState() => _SwipeUpWidgetState();
}

class _SwipeUpWidgetState extends State<SwipeUpWidget> {
  bool _isDropped = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Draggable<String>(
              data: "up",
              child: _isDropped ? Container() : const BottomBar(),
              feedback: _isDropped
                  ? Container()
                  : const BottomBar(showSwipeUp: false),
              childWhenDragging: Container(),
              axis: Axis.vertical,
            ),
          ),
          DragTarget(
            builder: (context, candidateData, rejectedData) {
              return _isDropped
                  ? Center(
                      child: TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 500),
                          tween: Tween<double>(begin: 1, end: 5),
                          onEnd: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen())),
                          builder: (context, value, _) {
                            return Transform.scale(
                              scale: value,
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }),
                    )
                  : SizedBox(
                      height: size.height * 0.6,
                      width: size.width,
                    );
            },
            onWillAccept: (data) {
              return data == 'up';
            },
            onAccept: (_) {
              setState(() {
                _isDropped = true;
              });
            },
          ),
        ],
      ),
    );
  }
}
