import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/shared/constans/commponant.dart';

import '../../provider/cart.dart';

class checkOutScreen extends StatelessWidget {
  const checkOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('check out'),
          actions: [
            (Row(
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
                          color: Colors.black87, fontWeight: FontWeight.w500),
                    )),
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
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text('${value.sum}'))
              ],
            ))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 530,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) => CheckOutItem(
                        path: '${value.selectedProducts[index].ItemPath}',
                        id: '$index',
                        cost: value.selectedProducts[index].price,
                        index: index
                      )),
                  separatorBuilder: ((context, index) => Container(width: double.infinity,height: 1,color: Colors.grey,)),
                  itemCount: value.selectedProducts.length),
            ),
            const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child:Text('pay${value.sum}'))
          ],
        ),
      ),
    );
  }
}
