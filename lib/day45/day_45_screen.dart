import 'package:flutter/material.dart';
import 'dart:math' as m;

import 'package:ui_design_day_41_50/day45/home_screen.dart';

class Day45Screen extends StatelessWidget {
  const Day45Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Transform.rotate(
                      angle: 6 * m.pi / 4,
                      child: const Text(
                        "Planto.Shop",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 2,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Plant a\ntree for\nlife",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Align(
                child: Column(
                  children: [
                    Image.asset("assets/images/day45/1.png", height: 300),
                    const SizedBox(height: 20),
                    const Text(
                      "Worldwide delivery\nwithin 10-15 days",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                child: Container(
                  width: 70,
                  height: 70,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 118, 174, 120)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                    },
                    child: const Text(
                      "Go",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
