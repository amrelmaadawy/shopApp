import 'package:flutter/cupertino.dart';
import 'package:shop_app/shared/constans/constans.dart';

class cart with ChangeNotifier {
  List selectedProducts = [];

  add(Item value) {
    selectedProducts.add(value);
    notifyListeners();
  }

  remove(Item value) {
    selectedProducts.remove(value);
    notifyListeners();
  }

  num sum = 0;
  priceAdd(cost) {
    sum = sum.round() + cost;
    notifyListeners();
  }
   priceRemove(cost) {
    sum = sum.round() - cost;
    notifyListeners();
  }
}
