import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day44/itme_screen.dart';
import 'dart:math' as m;

import 'package:ui_design_day_41_50/day44/top_bar_widget.dart';

const List itmes = [
  [
    "Troll Cave",
    "Even during the daytime, a troll cave is dark because the trolls keep the blinds pulled down so that the",
    "assets/images/day44/1.jpeg",
  ],
  [
    "Caradhras Iceberg",
    "Below the snowline, Caradhras is described as having dull red slopes, \"as if stained with blood\".",
    "assets/images/day44/2.jpg",
  ],
];

class Day44Scree extends StatelessWidget {
  const Day44Scree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBarWidget(),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    "Explore",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Transform.rotate(
                    angle: m.pi / 2.0,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          label: Text("Search a destination"),
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                    itemCount: itmes.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, index) =>
                        _buildItme(context, itme: itmes[index])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItme(context, {required List itme}) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ItmeScreen(itme: itme)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(itme[2]), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itme[0],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.bookmark,
                color: Colors.white,
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            itme[1],
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
            maxLines: 2,
            textScaleFactor: 1.2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
