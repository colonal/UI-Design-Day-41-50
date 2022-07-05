import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day49/sign_in_screen.dart';
import 'package:ui_design_day_41_50/day49/sign_up_screen.dart';

import 'button_widget.dart';

const List images = [
  [
    "assets/images/day49/0.gif",
    "LEARN ON THE GO",
    "Master your skills with fun and learn from very fundamentals."
  ],
  [
    "assets/images/day49/1.png",
    "LEARN ON THE GO",
    "Master your skills with fun and learn from very fundamentals."
  ],
  [
    "assets/images/day49/2.png",
    "LEARN ON THE GO",
    "Master your skills with fun and learn from very fundamentals."
  ],
  [
    "assets/images/day49/3.png",
    "LEARN ON THE GO",
    "Master your skills with fun and learn from very fundamentals."
  ],
];

class Day49Screen extends StatefulWidget {
  const Day49Screen({Key? key}) : super(key: key);

  @override
  State<Day49Screen> createState() => _Day49ScreenState();
}

class _Day49ScreenState extends State<Day49Screen> {
  int _selectIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.70,
              child: PageView.builder(
                controller: pageController,
                itemCount: images.length,
                onPageChanged: (value) {
                  setState(() {
                    _selectIndex = value;
                  });
                },
                itemBuilder: (_, index) =>
                    _buildPage(itme: images[index], height: size.height * 0.70),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: index == _selectIndex ? 40 : 10,
                      decoration: BoxDecoration(
                        color: index == _selectIndex
                            ? const Color(0xff3960DC)
                            : Colors.grey,
                        borderRadius: index == _selectIndex
                            ? BorderRadius.circular(8)
                            : BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(
                    text: "Sign in",
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LoginScreen()))),
                ButtonWidget(
                    text: "Sign up",
                    isEmpty: true,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SigninScreen()))),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  _buildPage({required itme, required double height}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Image.asset(
            itme[0],
            fit: BoxFit.fill,
            height: height * 0.70,
          ),
          Text(
            itme[1],
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              itme[2],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
