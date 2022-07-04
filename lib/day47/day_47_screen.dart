import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day47/cart_screen.dart';
import 'package:ui_design_day_41_50/day47/home_widget.dart';

class Day47Screen extends StatefulWidget {
  const Day47Screen({Key? key}) : super(key: key);

  @override
  State<Day47Screen> createState() => _Day47ScreenState();
}

class _Day47ScreenState extends State<Day47Screen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: _currentIndex == 2 ? const CartScreen() : const HomeWidget(),
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _currentIndex == 0 ? const Color(0xff9646FE) : Colors.grey,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color:
                    _currentIndex == 1 ? const Color(0xff9646FE) : Colors.grey,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket_outlined,
                color:
                    _currentIndex == 2 ? const Color(0xff9646FE) : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                color:
                    _currentIndex == 3 ? const Color(0xff9646FE) : Colors.grey,
              ),
              label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color:
                    _currentIndex == 4 ? const Color(0xff9646FE) : Colors.grey,
              ),
              label: 'account'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
