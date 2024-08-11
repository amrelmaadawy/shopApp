import 'package:flutter/material.dart';


TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

Widget stars() {
  return Row(
    children: [
      Icon(
        Icons.star,
        color: Colors.yellow.shade800,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow.shade800,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow.shade800,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow.shade800,
      ),
      Icon(
        Icons.star,
        color: Colors.yellow.shade800,
      ),
      const SizedBox(
        width: 50,
      ),
      Icon(
        Icons.location_on,
        color: Colors.green.shade800,
        size: 25,
      ),
      const Text(
        'flower shop',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      )
    ],
  );
}

class Item {
  String ItemPath;
  double price;

  Item({required this.ItemPath, required this.price});
}

final List<Item> foto = [
  Item(ItemPath: 'assets/image/1.png', price: 12.5),
  Item(ItemPath: 'assets/image/2.png', price: 12.5),
  Item(ItemPath: 'assets/image/3.png', price: 15.5),
  Item(ItemPath: 'assets/image/4.png', price: 12.5),
  Item(ItemPath: 'assets/image/5.png', price: 20.99),
  Item(ItemPath: 'assets/image/6.png', price: 19),
  Item(ItemPath: 'assets/image/7.png', price: 13.5),
  Item(ItemPath: 'assets/image/8.png', price: 14.5),
  Item(ItemPath: 'assets/image/9.png', price: 19.99),
  Item(ItemPath: 'assets/image/10.png', price: 19.99),
];
