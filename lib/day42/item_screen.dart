import 'package:flutter/material.dart';

const List catergories = [
  "assets/images/day42/6.jpg",
  "assets/images/day42/5.jpg",
  "assets/images/day42/4.jpg",
  "assets/images/day42/2.jpg",
  "assets/images/day42/2.jpg",
  "assets/images/day42/2.jpg",
];

class ItmeScreen extends StatefulWidget {
  final List itme;
  const ItmeScreen({required this.itme, Key? key}) : super(key: key);

  @override
  State<ItmeScreen> createState() => _ItmeScreenState();
}

class _ItmeScreenState extends State<ItmeScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.itme[3]), fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _circleButton(
                              icon: Icons.arrow_back_ios_new,
                              onPressed: () => Navigator.of(context).pop()),
                          _circleButton(
                              icon: Icons.favorite_border, onPressed: () {}),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 265,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) =>
                                  _buildCatergories(catergories[index], index),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -32),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.itme[0],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _buildIconText(
                              text: widget.itme[2].toString() + " (9K review)",
                              icon: Icons.star_border),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIconText(
                              text: widget.itme[1],
                              icon: Icons.location_on_outlined),
                          _buildIconText(
                              text: "Map Dirction",
                              icon: Icons.location_on_outlined,
                              isColor: true),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                        child: Center(
                          child: Divider(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Facilities",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "See all",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black.withOpacity(0.7),
                                size: 14,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildFacilies(
                            text: "1 Bed",
                            icon: Icons.bed,
                          ),
                          _buildFacilies(
                            text: "Guide",
                            icon: Icons.person_pin,
                            isbold: true,
                          ),
                          _buildFacilies(
                            text: "Dinner",
                            icon: Icons.dinner_dining_outlined,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: SingleChildScrollView(
                          child: Text(
                            "The Rolle Pass is a high mountain pass in Trentino in Italy. It connects the Fiemme and Primiero valleys, and the communities of Predazzo, San Martino di Castrores and Fiers di Primisco. The ne mad was",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "780",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("preson"),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: const Color(0xff20B08E),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Book Now",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildFacilies(
      {required String text, required IconData icon, bool isbold = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.4),
          ),
        ],
      ),
      child: _buildIconText(
        text: text,
        icon: icon,
        isbold: isbold,
      ),
    );
  }

  Row _buildIconText(
      {required String text,
      required IconData icon,
      bool isColor = false,
      bool isbold = false}) {
    return Row(
      children: [
        Icon(
          icon,
          color: isColor
              ? const Color(0xff20B08E)
              : isbold
                  ? Colors.black
                  : Colors.grey,
          size: 20,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
            color: isColor
                ? const Color(0xff20B08E)
                : isbold
                    ? Colors.black
                    : Colors.grey,
          ),
        ),
      ],
    );
  }

  Container _circleButton(
      {required void Function()? onPressed, required IconData icon}) {
    return Container(
      height: 40,
      width: 40,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 5),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildCatergories(String image, int index) {
    return Container(
      width: 55,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 4)),
      child: Container(
        width: 55,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 0),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: catergories.length > 4 && index == 3
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.2),
                  ]),
                ),
                child: Text(
                  "+" + (catergories.length - 4).toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              )
            : Container(),
      ),
    );
  }
}
