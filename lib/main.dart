import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day41/day_41_screen.dart';
import 'package:ui_design_day_41_50/day42/day_42_screen.dart';
import 'package:ui_design_day_41_50/day43/day_43_screen.dart';
import 'package:ui_design_day_41_50/day44/day_44_screen.dart';
import 'package:ui_design_day_41_50/day45/day_45_screen.dart';
import 'package:ui_design_day_41_50/day46/day_46_screen.dart';
import 'package:ui_design_day_41_50/day47/day_47_screen.dart';
import 'package:ui_design_day_41_50/day48/day_48_screen.dart';

import 'app_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.grey,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day41Screen())),
              child: const Text(
                "Day 41",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day42Screen())),
              child: const Text(
                "Day 42",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.orangeAccent,
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day43Screen())),
              child: const Text(
                "Day 43",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.yellow[900],
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day44Scree())),
              child: const Text(
                "Day 44",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: Colors.grey[900],
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day45Screen())),
              child: const Text(
                "Day 45",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: const Color(0xff3C3B80),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day46Screen())),
              child: const Text(
                "Day 46",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: const Color(0xff3C3B80),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day47Screen())),
              child: const Text(
                "Day 47",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              color: const Color.fromARGB(255, 59, 128, 128),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const Day48Screen())),
              child: const Text(
                "Day 48",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
