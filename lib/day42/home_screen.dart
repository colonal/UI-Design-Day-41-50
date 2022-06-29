import 'package:flutter/material.dart';

import 'item_screen.dart';

const List expolre = ["All", "Popular", "REcommended", "Most Viewed"];
const List imageExpolre = [
  ["Mar caribe, avenida lago", "Thailand", 4.9, "assets/images/day42/1.jpg"],
  ["Passo Rolle, TN", "Italia", 4.7, "assets/images/day42/3.jpg"],
  ["paris", "France", 4.8, "assets/images/day42/6.jpg"],
  ["Mar caribe, avenida lago", "Thailand", 4.9, "assets/images/day42/5.jpg"],
];
const List catergories = [
  ["Mountains", "assets/images/day42/6.jpg"],
  ["Camp", "assets/images/day42/5.jpg"],
  ["Beach", "assets/images/day42/4.jpg"],
  ["Mountains", "assets/images/day42/2.jpg"],
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indexExpolre = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 236, 236),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: _currentIndex == 0 ? const Color(0xff20B08E) : Colors.grey,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
                color:
                    _currentIndex == 1 ? const Color(0xff20B08E) : Colors.grey,
              ),
              label: 'map'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages_rounded,
                color:
                    _currentIndex == 2 ? const Color(0xff20B08E) : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
                color:
                    _currentIndex == 3 ? const Color(0xff20B08E) : Colors.grey,
              ),
              label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color:
                    _currentIndex == 4 ? const Color(0xff20B08E) : Colors.grey,
              ),
              label: 'account'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text.rich(
                      TextSpan(
                        text: "Hi ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "Williamson,",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Where do you want\nto go?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: const Text("Discover a city"),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      suffixIcon: Icon(
                        Icons.menu,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Explore Cities",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: expolre.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 5),
                    itemBuilder: (context, index) => _buildExplore(index),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageExpolre.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) =>
                        _buildImageExpolre(imageExpolre[index], index),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Catergories",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black.withOpacity(0.7),
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: catergories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) =>
                        _buildCatergories(catergories[index], index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildExplore(int index) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            _indexExpolre = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            expolre[index],
            style: TextStyle(
                fontSize: 16,
                color: _indexExpolre == index ? Colors.black : Colors.grey),
          ),
        ),
      ),
    );
  }

  _buildImageExpolre(List itme, int index) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ItmeScreen(itme: itme))),
      child: Container(
        width: 200,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(itme[3]), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itme[0],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        itme[1],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.star_border,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        itme[2].toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCatergories(List itme, int index) {
    return Container(
      width: 80,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 0),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.3),
            ),
          ]),
      child: Column(
        children: [
          Image.asset(
            itme[1],
            fit: BoxFit.fill,
            height: 80 * 0.7,
            width: 80,
          ),
          Text(itme[0]),
        ],
      ),
    );
  }
}
