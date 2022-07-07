import 'dart:math' as m;
import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day50/workouts_widget.dart';
import 'package:ui_design_day_41_50/day50/yoga_class_widget.dart';

const List ratings = [
  "Popular",
  "New",
  "Recommended",
  "Hardes",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectRating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Stack(
                        children: [
                          const Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: CircleAvatar(
                              backgroundColor: Colors.red[600],
                              radius: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Explore",
                  style: TextStyle(
                    color: Color(0xff020002),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    wordSpacing: 1.5,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.black54),
                    suffixIcon: Transform.rotate(
                      angle: m.pi / 2,
                      child: const Icon(
                        Icons.candlestick_chart_outlined,
                        color: Colors.black54,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[800]!),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: ratings.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (_, index) => _buildRatings(index: index),
                  ),
                ),
                const SizedBox(height: 20),
                const YogaClassWidget(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Try the workouts",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: double.infinity,
                  child: WorkoutsWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildRatings({required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectRating = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: _selectRating == index ? Colors.grey[200] : Colors.white,
          border: Border.all(
            color: Colors.grey[200]!,
          ),
        ),
        child: Center(
          child: Text(
            ratings[index],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
