import 'package:flutter/material.dart';
import 'package:flutter_provider1/model/product.dart';
import 'package:flutter_provider1/model/shopping_cart.dart';
import 'package:provider/provider.dart';

class ShoppingCarPage extends StatefulWidget {
  const ShoppingCarPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCarPage> createState() => _ShoppingCarPageState();
}

class _ShoppingCarPageState extends State<ShoppingCarPage> {


  @override
  Widget build(BuildContext context) {

    List<Product> list = context.watch<ShoppingCart>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("购物车"),
      ),
      body: ListView.builder(itemCount: list.length, itemBuilder: (context,index){


        return ListTile(
          leading: Image.network(
            'https://img1.baidu.com/it/u=1147116283,1048004671&fm=253&fmt=auto&app=138&f=JPG?w=499&h=312',
            width: 100,),
          title: Text('${list[index].name}'),
          trailing: IconButton(icon: const Icon(Icons.remove) ,onPressed: (){
            Provider.of<ShoppingCart>(context,listen: false).remove(list[index]);
          },),
        );
      }),
    );
  }
}
