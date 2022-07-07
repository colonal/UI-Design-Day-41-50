import 'dart:async';

import 'package:flutter/material.dart';

const List images = [
  "assets/images/day50/1.jpg",
  "assets/images/day50/2.jpg",
  "assets/images/day50/3.jpg",
  "assets/images/day50/4.jpg",
];
const List colors = [
  Color.fromARGB(200, 200, 200, 0),
  Color.fromARGB(199, 180, 180, 67),
  Color.fromARGB(199, 192, 113, 24),
  Color.fromARGB(199, 15, 41, 32),
];

class ImagesWidget extends StatefulWidget {
  final double height;

  const ImagesWidget({required this.height, Key? key}) : super(key: key);

  @override
  State<ImagesWidget> createState() => _TState();
}

class _TState extends State<ImagesWidget> {
  int _selectimage = 0;
  double _opacity = 1;
  late Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _opacity = 0.3;
      });
      Future.delayed(const Duration(seconds: 1)).then((value) {
        if (_timer != null) {
          setState(() {
            _selectimage = _selectimage == 3 ? 0 : ++_selectimage;
            _opacity = 1;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: _opacity,
        curve: Curves.linear,
        alwaysIncludeSemantics: true,
        child: 1 == 2
            ? Container(
                color: colors[_selectimage],
              )
            : Image.asset(
                images[_selectimage],
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
