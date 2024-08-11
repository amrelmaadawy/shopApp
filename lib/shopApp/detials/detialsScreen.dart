import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/constans/constans.dart';
import 'package:shop_app/shared/cubit/bloc/cubit.dart';
import 'package:shop_app/shared/cubit/stats/StatesScreen.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';

class detials extends StatelessWidget {
  Item product;
  detials({required this.product});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, States>(
          listener: ((context, state) {}),

          // Scroll error try again later
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(height: 350,child: Image.asset(product.ItemPath),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        '\$${product.price}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.red.shade300,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                'New',
                                style:  TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        stars()
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Detials:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                    //logic Error check later
                    Text(
                      'A floral formula is a way to represent the structure of a flower using specific letters, numbers, and symbols, presenting substantial information about the flower in a compact form',
                      style: const TextStyle(fontSize: 20),
                      maxLines: cubit.isShowMore ? 3 : null,
                      overflow: TextOverflow.ellipsis,
                    ),

                    TextButton(
                        onPressed: () {
                          cubit.showMore();
                        },
                        child: Center(
                            child: Text(
                          cubit.isShowMore ? 'show more' : 'show less',
                          style: const TextStyle(color: Colors.blue),
                        )))
                  ],
                ),
              ),
              appBar: AppBar(
                
                title: const Text('detials Screen'),
                actions: [
                  Consumer<cart>(
                    builder: (context, list, child) => 
                     Row(
                      
                      children: [
                        Stack(children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green.shade200,
                            ),
                            child: (
                             Text(
                                '${list.selectedProducts.length}',
                                style:const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500),
                              ) 
                            
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_shopping_cart_rounded),
                            onPressed: () {},
                          ),
                        ]),
                        const SizedBox(
                          width: 8,
                        ),
                         Padding(
                          padding:const EdgeInsets.only(right: 8.0),
                          child:  Text('${list.sum}'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
