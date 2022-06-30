import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day43/page_view_widget.dart';

const List itmes = [
  [
    "Find the right trusted caregiver for your family",
    "assets/images/day43/1.png"
  ],
  ["Share your needs by creating a job post", "assets/images/day43/2.png"],
  ["Make fast and easy payments through the app", "assets/images/day43/3.png"],
];

class Day43Screen extends StatefulWidget {
  const Day43Screen({Key? key}) : super(key: key);

  @override
  State<Day43Screen> createState() => _Day43ScreenState();
}

class _Day43ScreenState extends State<Day43Screen> {
  int _indexSelect = 0;
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: itmes.length,
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _indexSelect = index;
                    });
                  },
                  itemBuilder: (_, index) => PageViewWidget(itme: itmes[index]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    itmes.length, (index) => _buildCountScreen(index)),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(text: "Log In", onPressed: () {}),
                  _buildButton(
                      text: "Sign Up", isBackground: true, onPressed: () {}),
                ],
              ),
              const SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  text: "Find a care job ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  children: [
                    TextSpan(
                      text: "Get here",
                      style: const TextStyle(
                          color: Color(0xff3A76ED), fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => debugPrint('Get Here'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCountScreen(index) {
    return GestureDetector(
      onTap: () => setState(() {
        _indexSelect = index;
        _controller.jumpToPage(index);
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Color(_indexSelect == index ? 0xff3A76ED : 0xffD5E0F3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  _buildButton(
      {required String text,
      required void Function()? onPressed,
      bool isBackground = false}) {
    return Container(
      height: 40,
      width: 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(isBackground ? 0xff3676FB : 0xffffffff),
        border: Border.all(
          color: const Color(0xff3676FB),
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (isBackground)
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 5),
              color: const Color(0xff3676FB).withOpacity(0.5),
            )
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Color(isBackground ? 0xffffffff : 0xff3676FB),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
