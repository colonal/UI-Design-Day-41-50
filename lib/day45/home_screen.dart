import 'package:flutter/material.dart';
import 'dart:math' as m;

import 'package:ui_design_day_41_50/day45/itme_screen.dart';

const List types = [
  "All",
  "Indoor",
  "Outdoor",
  "Popular",
];
const List itmes = [
  ["Monstera", "\$39", "assets/images/day45/1.png"],
  ["Ageratum", "\$48", "assets/images/day45/2.png"],
  ["Monstera", "\$39", "assets/images/day45/4.png"],
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectType = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Find your\nfavorite plants",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  )
                ],
              ),
              const SizedBox(height: 30),
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "30% OFF",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              "02-23 July",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Transform.translate(
                      offset: const Offset(0, -50),
                      child:
                          Image.asset("assets/images/day45/4.png", height: 150),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => _buildType(index: index),
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemCount: types.length),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 260,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) =>
                        _buildItmes(itme: itmes[index], index: index),
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemCount: itmes.length),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  BottomNavigationBar _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: CircleAvatar(
            maxRadius: 30,
            backgroundColor: _currentIndex == 0
                ? const Color(0xff20B08E)
                : Colors.transparent,
            child: Icon(
              Icons.home_outlined,
              color: _currentIndex == 0 ? Colors.white : Colors.grey,
            ),
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              maxRadius: 30,
              backgroundColor: _currentIndex == 1
                  ? const Color(0xff20B08E)
                  : Colors.transparent,
              child: Icon(
                Icons.card_travel,
                color: _currentIndex == 1 ? Colors.white : Colors.grey,
              ),
            ),
            label: 'map'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              maxRadius: 30,
              backgroundColor: _currentIndex == 2
                  ? const Color(0xff20B08E)
                  : Colors.transparent,
              child: Icon(
                Icons.qr_code_scanner_sharp,
                color: _currentIndex == 2 ? Colors.white : Colors.grey,
              ),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              maxRadius: 30,
              backgroundColor: _currentIndex == 3
                  ? const Color(0xff20B08E)
                  : Colors.transparent,
              child: Icon(
                Icons.favorite_outline,
                color: _currentIndex == 3 ? Colors.white : Colors.grey,
              ),
            ),
            label: 'favorite'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              maxRadius: 30,
              backgroundColor: _currentIndex == 4
                  ? const Color(0xff20B08E)
                  : Colors.transparent,
              child: Icon(
                Icons.person_outline,
                color: _currentIndex == 4 ? Colors.white : Colors.grey,
              ),
            ),
            label: 'account'),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  _buildType({required int index}) {
    return Container(
      height: 50,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          border: Border.all(
              color: _selectType == index ? Colors.black : Colors.transparent)),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            _selectType = index;
          });
        },
        child: Text(
          types[index],
          style: TextStyle(
            color: _selectType == index ? Colors.black : Colors.grey,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  _buildItmes({required itme, required int index}) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ItmeScreen(itme: itme)));
      },
      child: Stack(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 246, 246, 222),
            ),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Expanded(
                  child: Image.asset(
                    itme[2],
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 3,
            child: Text(
              itme[1],
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          Positioned(
            left: -30,
            top: 132,
            child: Transform.rotate(
              angle: 6 * m.pi / 4,
              child: Text(
                itme[0],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
