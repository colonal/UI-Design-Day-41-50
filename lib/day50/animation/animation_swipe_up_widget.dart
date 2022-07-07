import 'package:flutter/material.dart';

class AnimationSwipeUpWidget extends StatefulWidget {
  final Widget child;
  const AnimationSwipeUpWidget({required this.child, Key? key})
      : super(key: key);

  @override
  State<AnimationSwipeUpWidget> createState() => _AnimationSwipeUpWidgetState();
}

class _AnimationSwipeUpWidgetState extends State<AnimationSwipeUpWidget>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();

    _animation = Tween<Offset>(
            begin: const Offset(0, 0.6), end: const Offset(0, 0.1))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2,
      child: SlideTransition(
        position: _animation,
        child: Transform.translate(
          offset: const Offset(0, 20),
          child: widget.child,
        ),
      ),
    );
  }
}
