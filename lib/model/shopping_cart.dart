import 'package:flutter/foundation.dart';
import 'package:flutter_provider1/model/product.dart';

class ShoppingCart extends ChangeNotifier{
  final List<Product> _cart = <Product>[];
  List<Product> get cart => _cart;

  add(Product item){
    _cart.add(item);
    notifyListeners();
  }
  remove(Product item){
    _cart.remove(item);
    notifyListeners();
  }

  removeAll(){
    _cart.clear();
    notifyListeners();
  }
}