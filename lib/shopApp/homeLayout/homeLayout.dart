import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/shared/cubit/bloc/cubit.dart';
import 'package:shop_app/shared/cubit/stats/StatesScreen.dart';
import 'package:shop_app/shopApp/checkOut/checkOut.dart';
import 'package:shop_app/shopApp/detials/detialsScreen.dart';
import 'package:shop_app/shopApp/login/loginScreen.dart';

import '../../shared/constans/constans.dart';

class homeLayout extends StatelessWidget {
  const homeLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            // donot forget to add shimmer effect
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1 / 1,
                  ),
                  itemCount: foto.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => detials(
                                      product: foto[index],
                                    ))));
                      },
                      child: GridTile(
                        footer: GridTileBar(
                            title: const Text(''),
                            trailing: Consumer<cart>(
                              builder: (context, test, child) => IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  //  cubit.isPressed(index);
                                  test.add(foto[index]);
                                  test.priceAdd(foto[index].price);
                                },
                                color: Colors.black,
                              ),
                            ),
                            leading: Text(
                              '${foto[index].price}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                        child: Stack(children: [
                          Positioned(
                            right: 0,
                            left: 0,
                            top: -3,
                            bottom: -9,
                            child: ClipRRect(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(foto[index].ItemPath),
                                )),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  })),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  const UserAccountsDrawerHeader(
                      accountName: Text('Amr Mahamed Elmaadawy'),
                      accountEmail: Text('amr@gmail.com'),
                      currentAccountPicture:  CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/image/IMG_20230615_103126.jpg"),
                        radius: 55,
                      )),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const homeLayout())),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_shopping_cart),
                    title: const Text('My product'),
                    onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const checkOutScreen())),
                      );},
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
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>  loginScreen())),
                      );
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
                              style:
                                   TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                Consumer<cart>(
                  builder: (context, value, child) => Row(
                    children: [
                      Stack(children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade200,
                          ),
                          child: (Text(
                            '${value.selectedProducts.length}',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart_rounded),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const checkOutScreen())));
                          },
                        ),
                      ]),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('${value.sum}'))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
