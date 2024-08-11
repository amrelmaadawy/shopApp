import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/shared/constans/constans.dart';

Widget formField({
  GestureTapCallback? onTap,
  FormFieldValidator<String>? validat,
  required bool obscure,
  required TextInputType? textInput,
  required TextEditingController? controller,
  dynamic suffix,
  required Text? text,
  VoidCallback? onPress,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: TextFormField(
      onTap: onTap,
      validator: validat,
      obscureText: obscure,
      keyboardType: textInput,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(icon: suffix, onPressed: onPress),
        label: text,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}

Widget defultElevatButton({
  required Text text,
  required VoidCallback pressed,
}) {
  return ElevatedButton(
    onPressed: pressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green.shade700),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    child: text,
  );
}

Widget CheckOutItem(
    {required String path,
    required String id,
    required num cost,
    required index}) {
  return Consumer<cart>(
    builder: (context, value, child) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.asset(
            path,
            width: 70,
            height: 70,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'product number $id',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                '\$$cost',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          IconButton(
              onPressed: () {
                value.remove(value.selectedProducts[index]);
                value.priceRemove(foto[index].price);
              },
              icon: const Icon(Icons.minimize))
        ],
      ),
    ),
  );
}
