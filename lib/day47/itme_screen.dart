import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day47/data.dart';

class ItmeScreen extends StatelessWidget {
  final List itme;
  const ItmeScreen({required this.itme, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(itme[2]), fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itme[3]} Direction",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "${itme[0]}et",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      "/ ${itme[1]}\$",
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          "https://cdn.dribbble.com/userupload/2796043/file/original-61c7ed6d4266f72be43828f9976bd9af.jpg?compress=1&resize=1200x900"),
                      radius: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "@Jafari2020",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "visual effect artist",
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),
                Text(
                  "Hey, I am a professional video editor and visual effect artist with over 5 years of experience. I am an expert....",
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff9646FE),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      cards.add(itme);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
