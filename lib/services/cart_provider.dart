import 'db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/model/restaurant.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  late Future<List<MenuItem>> _cart;
  Future<List<MenuItem>> get cart => _cart;

  Future<List<MenuItem>> getData() async {
    try {
      _cart = db.getCartList();
    } catch (e) {
      debugPrint("Provider Error: ${e.toString()}");
    }

    return _cart;
  }

  void refresh() {
    notifyListeners();
  }

  double getTotalPrice() {
    return _totalPrice;
  }

  void newTotalIncrement(String val) {
    _totalPrice += double.parse(val);
  }

  void newTotalDecrement(String val) {
    _totalPrice -= double.parse(val);
  }
}
