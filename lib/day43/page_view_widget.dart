import 'package:flutter/material.dart';

import 'opacity_widget.dart';

class PageViewWidget extends StatelessWidget {
  final List itme;
  const PageViewWidget({required this.itme, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpacityWidget(
      child: Column(
        children: [
          Text(
            itme[0],
            style: const TextStyle(color: Color(0xff444261), fontSize: 40),
          ),
          Expanded(
            child: Image.asset(
              itme[1],
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
