import 'package:flutter/material.dart';

import 'animation/images_widget.dart';
import 'animation/swipe_up_widget.dart';

class Day50Screen extends StatelessWidget {
  const Day50Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Stack(
            children: [
              Column(
                children: [
                  ImagesWidget(height: size.height * 0.4),
                  const SizedBox(height: 20),
                  const Text(
                    "The Base For\nYour Results",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Add variety to your life with workouts that get results",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SwipeUpWidget()
            ],
          ),
        ),
      ),
    );
  }
}
