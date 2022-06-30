import 'package:flutter/material.dart';

class OpacityWidget extends StatefulWidget {
  final Widget child;
  const OpacityWidget({required this.child, Key? key}) : super(key: key);

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _container;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _container = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        upperBound: 1,
        lowerBound: 0);
    _animation = CurvedAnimation(parent: _container, curve: Curves.linear);
    _container.forward();
  }

  @override
  void dispose() {
    _container.reverse();
    _container.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
