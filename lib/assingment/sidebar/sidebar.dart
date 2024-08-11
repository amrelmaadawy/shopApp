import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/assingment/home/home.dart';
import 'package:shop_app/assingment/login/login.dart';

Widget drawer(context) {
  return Drawer(
    child: Column(
      children: [
        const UserAccountsDrawerHeader(
            accountName: Text('Amr Mahamed Elmaadawy'),
            accountEmail: Text('amr@gmail.com'),
            currentAccountPicture:  CircleAvatar(
              backgroundImage: AssetImage("assets/image/1.png"),
              radius: 55,
            )),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => const home())),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('My product'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.help_center),
          title: const Text('about'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('log out'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => login())));
          },
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'developed by Amr Elmaadawy @ 2023',
                    style:  TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        )
      ],
    ),
  );
}
