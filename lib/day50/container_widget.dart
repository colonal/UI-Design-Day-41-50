import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;
  const ContainerWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 190,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: _buildContainer(
                color: const Color(0xffFFE6FD), width: size.width * 0.7),
          ),
          Positioned(
            top: 10,
            child: _buildContainer(
                color: const Color(0xffD9CDF8), width: size.width * 0.8),
          ),
          Positioned(
            top: 20,
            child: _buildContainer(
              color: Colors.black,
              width: size.width * 0.9,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildContainer(
      {required double width, required Color color, Widget? child}) {
    return Container(
      height: 170,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
