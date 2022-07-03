import 'package:flutter/material.dart';

class ItmeScreen extends StatefulWidget {
  final List itme;
  const ItmeScreen({required this.itme, Key? key}) : super(key: key);

  @override
  State<ItmeScreen> createState() => _ItmeScreenState();
}

class _ItmeScreenState extends State<ItmeScreen> {
  int? _readMore = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                          size: 30,
                        )),
                    const Text(
                      "Details",
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 30,
                        )),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset(
                  widget.itme[2],
                  fit: BoxFit.fill,
                  height: 250,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      widget.itme[0],
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.green[300],
                    ),
                    const Text(
                      "4.8",
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                    const Text(
                      "(268 Reviews)",
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Ageratum is a genus of 40 to 60 tropical and warm temperate flowering annuals and perennials from the family Asteraceae, tribe Eupatorieae. Most species are native to Central America",
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                  overflow: TextOverflow.fade,
                  maxLines: _readMore,
                ),
                if (_readMore != null)
                  InkWell(
                    onTap: () {
                      setState(() {
                        _readMore = null;
                      });
                    },
                    child: Text(
                      "Read More",
                      style: TextStyle(color: Colors.green[300], fontSize: 16),
                    ),
                  ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfo(info: "Size", data: "Medium"),
                    _buildInfo(info: "Piant", data: "Orchid"),
                    _buildInfo(info: "Height", data: "12.6\""),
                    _buildInfo(info: "Humidnity", data: "82%"),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfo(info: "price", data: widget.itme[1], size: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green[300],
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildInfo(
      {required String info, required String data, double size = 20}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info,
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
          overflow: TextOverflow.fade,
          maxLines: 3,
        ),
        Text(
          data,
          style: TextStyle(
              color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
