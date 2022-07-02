import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day44/top_bar_widget.dart';

class ItmeScreen extends StatelessWidget {
  final List itme;
  const ItmeScreen({required this.itme, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TopBarWidget(),
              ),
              const SizedBox(height: 20),
              Image.asset(
                itme[2],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 350,
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          itme[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      itme[1],
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                      ),
                      maxLines: 2,
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 50,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 192, 9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    "Book this trip",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
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
