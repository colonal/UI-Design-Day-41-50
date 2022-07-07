import 'package:flutter/material.dart';

import 'container_widget.dart';
import 'progress_indicator_widget.dart';

class YogaClassWidget extends StatefulWidget {
  const YogaClassWidget({Key? key}) : super(key: key);

  @override
  State<YogaClassWidget> createState() => _YogaClassWidgetState();
}

class _YogaClassWidgetState extends State<YogaClassWidget> {
  double _value = 0;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _value = 0.6;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Yoga Class",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
              const Text(
                "Boost of energy",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Progress",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: ProgressIndicatorWidget(value: _value),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${_value * 100}%",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Difficulty",
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 20,
                    width: 60,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => CircleAvatar(
                          radius: 4,
                          backgroundColor:
                              index == 0 ? Colors.white : Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
