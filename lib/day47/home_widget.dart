import 'package:flutter/material.dart';
import 'package:ui_design_day_41_50/day47/data.dart';
import 'package:ui_design_day_41_50/day47/itme_screen.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Discover",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  "SORT BY PRICE",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
            const Icon(
              Icons.settings_outlined,
              color: Colors.grey,
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ListView.separated(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, index) => _buildItme(context, itmes[index], index),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: _buildItme(
            context,
            itmes[3],
            3,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ListView.separated(
            itemCount: itmes.length - 4,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, index) =>
                _buildItme(context, itmes[index + 4], index),
          ),
        ),
      ],
    );
  }

  _buildItme(context, itme, int index, {double width = 160}) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ItmeScreen(itme: itme)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(itme[2]), fit: BoxFit.fill),
              ),
            ),
          ),
          const SizedBox(height: 5),
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
          )
        ],
      ),
    );
  }
}
