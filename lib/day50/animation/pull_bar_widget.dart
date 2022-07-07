import 'package:flutter/material.dart';

class PullBarWidget extends StatelessWidget {
  const PullBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 100,
      child: Stack(
        children: [
          ...List.generate(7, (index) {
            if (index != 0) {
              return _buildWidget(
                  offSet: Offset(index * 10, (index + 4) * 10), index: index);
            }
            return Container();
          }),
          ...List.generate(7, (index) {
            if (index != 0) {
              return _buildWidget(
                  offSet: Offset(index * -10, (index + 4) * 10), index: index);
            }
            return Container();
          }),
          _buildWidget(offSet: const Offset(0, 40)),
        ],
      ),
    );
  }

  _buildWidget({required Offset offSet, int index = 1}) {
    return Transform.translate(
      offset: offSet,
      child: Container(
        height: 160,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity((11 - index) * 0.1),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
