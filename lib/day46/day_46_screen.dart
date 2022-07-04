import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day46/card_screen.dart';
import 'package:ui_design_day_41_50/day46/home_widget.dart';

class Day46Screen extends StatefulWidget {
  const Day46Screen({Key? key}) : super(key: key);

  @override
  State<Day46Screen> createState() => _Day46ScreenState();
}

class _Day46ScreenState extends State<Day46Screen> {
  int _seletct = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.9,
              child: _seletct == 0 ? const HomeWidget() : const CardScreen(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CardScreen()));
                  },
                  child: _buildbottomItme(
                      icon: Icons.card_membership_outlined,
                      text: "Card",
                      index: 1),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _seletct = 0;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: const Color(0xff292857),
                    radius: 30,
                    child: Icon(
                      Icons.local_parking_outlined,
                      color: _seletct == 0 ? Colors.white : null,
                      size: 35,
                    ),
                  ),
                ),
                _buildbottomItme(
                    icon: Icons.account_circle_rounded,
                    text: "Account",
                    index: 2),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildbottomItme(
      {required IconData icon, required String text, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _seletct = index;
        });
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: _seletct == index ? Colors.black : Colors.grey,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
                color: _seletct == index ? Colors.black : Colors.grey,
                fontSize: 20),
          )
        ],
      ),
    );
  }
}
