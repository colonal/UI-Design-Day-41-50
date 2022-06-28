import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day41/itme_screen.dart';

const color = 0xff424242;
final List types = [
  ["Feature", "assets/images/featureL.png", "assets/images/featureD.png"],
  ["Apartment", "assets/images/apartmentL.png", "assets/images/apartmentD.png"],
  ["lgloo", "assets/images/iglooL.png", "assets/images/iglooD.png"],
  ["Host", "assets/images/apartmentL.png", "assets/images/apartmentD.png"],
];

final List itmes = [
  ["Mobile home", 4.95, "assets/images/1.png"],
  ["Manufactured", 4.94, "assets/images/2.jpg"],
  ["Living Roof", 4.95, "assets/images/3.jpg"],
];

class Day41Screen extends StatefulWidget {
  const Day41Screen({Key? key}) : super(key: key);

  @override
  State<Day41Screen> createState() => _Day41ScreenState();
}

class _Day41ScreenState extends State<Day41Screen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "DISCOVER\nYOUR PLACE\nTO STAY",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications_none_outlined,
                        color: Color(color),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Color(color),
                      ),
                      suffixIcon: Icon(
                        Icons.segment_outlined,
                        color: Color(color),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 120,
                  alignment: Alignment.center,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: types.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (_, index) =>
                        _type(type: types[index], index: index),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: itmes.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (_, index) => _itme(itme: itmes[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _type({required List type, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          _index = index;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: _index == index ? const Color(color) : Colors.grey[200],
              borderRadius: _index == index
                  ? const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )
                  : BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                _index == index ? type[1] : type[2],
                width: 50,
                height: 50,
              ),
            ),
          ),
          Text(
            type[0],
            style: const TextStyle(
              color: Color(color),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itme({required List itme}) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ItmeScreen(itme))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage(itme[2]), fit: BoxFit.cover)),
          ),
          const SizedBox(height: 5),
          Text(
            itme[0],
            style: const TextStyle(color: Color(color), fontSize: 16),
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow[800],
                size: 19,
              ),
              Text(
                itme[1].toString(),
                style: const TextStyle(color: Color(color), fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
