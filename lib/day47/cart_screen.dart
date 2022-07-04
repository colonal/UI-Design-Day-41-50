import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day47/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0;
  int money = 0;
  @override
  void initState() {
    super.initState();
    for (var element in cards) {
      total += element[0];
      money += element[1] as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Cart",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: cards.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, index) => _buildItme(cards[index]),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Column _buildBottomBar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  total.toString() + "eth",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  money.toString() + "eth",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 60,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff9646FE),
          ),
          child: MaterialButton(
            onPressed: () {},
            child: const Text(
              "PAY NOW",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildItme(card) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(card[2]), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card[3],
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "${card[0]}et",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      "/ ${card[1]}\$",
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.2),
          child: IconButton(
            onPressed: () {
              cards.remove(card);
              setState(() {});
            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.grey[800],
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
