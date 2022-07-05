import 'package:flutter/material.dart';

class ItmeScreen extends StatefulWidget {
  final List itme;
  const ItmeScreen({required this.itme, Key? key}) : super(key: key);

  @override
  State<ItmeScreen> createState() => _ItmeScreenState();
}

class _ItmeScreenState extends State<ItmeScreen> {
  int _countItme = 0;
  int? _maxLisn = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail",
          style: TextStyle(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Image.asset(
                  widget.itme[3],
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.itme[1],
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.redAccent,
                    size: 30,
                  )
                ],
              ),
              Row(
                children: [
                  ...List.generate(
                    4,
                    (index) => const Icon(
                      Icons.star,
                      color: Color(0xff5AC9DC),
                    ),
                  ),
                  const Text(
                    "4.0",
                    style: TextStyle(
                        color: Color(0xff5AC9DC),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(color: Color.fromRGBO(0, 0, 0, 1), indent: 2),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.itme[2]}",
                    style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Row(
                    children: [
                      _buildButton(
                          icon: Icons.add,
                          onTap: () {
                            setState(() {
                              ++_countItme;
                            });
                          }),
                      const SizedBox(width: 10),
                      Text(
                        _countItme.toString(),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      _buildButton(
                          icon: Icons.remove,
                          onTap: () {
                            setState(() {
                              if (_countItme != 0) --_countItme;
                            });
                          }),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black, indent: 2),
              const Text(
                "Description",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _maxLisn = _maxLisn == null ? 2 : null;
                  });
                },
                child: Text(
                  "Himalaya Bresol Syrup is a cough medicine containing maleate which is used to relieve coughs accompanied by flu symptoms such as fever, headache, and sneezing",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  maxLines: _maxLisn,
                  overflow: _maxLisn != null ? TextOverflow.ellipsis : null,
                ),
              ),
              if (_maxLisn != null)
                InkWell(
                  onTap: () {
                    setState(() {
                      _maxLisn = null;
                    });
                  },
                  child: const Text(
                    "Read mor",
                    style: TextStyle(
                        color: Color(0xff5AC9DC),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffE7FBFF)),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Color(0xff5AC9DC),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff5AC9DC),
                      ),
                      child: MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      {required IconData icon, required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.grey[600],
            size: 25,
          ),
        ),
      ),
    );
  }
}
