import 'dart:math' as m;

import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day48/itme_screen.dart';

const List category = [
  ["Medicine", "assets/images/day48/medicine.png", Color(0xffAFE4EB)],
  ["Elements", "assets/images/day48/elements.png", Color(0xffCBE6F6)],
  ["Cosmetics", "assets/images/day48/cosmetics.png", Color(0xffFFFBBF)],
  ["Vitamin", "assets/images/day48/vitamin.png", Color(0xffE7E4FB)],
];

const List itmes = [
  ["Pills", "Himalaya Bresol", 80, "assets/images/day48/1.png"],
  ["Glucose", "Gestational", 70, "assets/images/day48/2.png"],
];

class Day48Screen extends StatelessWidget {
  const Day48Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Pharmacy",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: const [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.grey,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search ...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffE8F4F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Upload Prescription.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "We will show the pharmacy that got all the medicine",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildUploadItme(
                          text: "Share Link",
                          angle: 3 * m.pi / 4,
                          icon: const Icon(
                            Icons.link,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildUploadItme(
                          text: "Upload",
                          icon: const Icon(
                            Icons.file_upload_outlined,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Category",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => _buildCategory(category[index]),
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemCount: category.length,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) =>
                    _buildItme(context, itme: itmes[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: itmes.length,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff292A4A),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }

  _buildUploadItme(
      {required String text,
      required Widget icon,
      double angle = 0.0,
      isBold = false}) {
    return Column(
      children: [
        Container(
          height: isBold ? 80 : 50,
          width: isBold ? 80 : 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Transform.rotate(
            angle: angle,
            child: icon,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
              color: Colors.black.withOpacity(0.7), fontSize: isBold ? 18 : 12),
        )
      ],
    );
  }

  _buildCategory(List itme) {
    return _buildUploadItme(
      text: itme[0],
      icon: Container(
        width: 80,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: itme[2]),
        child: Image.asset(itme[1]),
      ),
      isBold: true,
    );
  }

  _buildItme(context, {required itme}) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ItmeScreen(itme: itme)));
      },
      child: Container(
        height: 130,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Image.asset(
                itme[3],
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itme[0],
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  itme[1],
                  style: const TextStyle(color: Colors.black87, fontSize: 18),
                ),
                Text(
                  "\$${itme[2]}",
                  style:
                      const TextStyle(color: Colors.orangeAccent, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
