import 'package:flutter_provider1/model/product.dart';

class ProductModel{
  List<Product> list = <Product>[];
  ProductModel.init(){
    for(var i = 0; i < 20; i++){
      var product = Product(id:i,name: 'product-${i}',price: i);
      list.add(product);
    }
  }
}