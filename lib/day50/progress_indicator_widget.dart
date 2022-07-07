import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  const ProgressIndicatorWidget({this.value = 1, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints constraints) {
      return Container(
        height: 8,
        width: constraints.maxWidth,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            height: 8,
            width: constraints.maxWidth * value,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      );
    });
  }
}
