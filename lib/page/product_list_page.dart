import 'package:flutter/material.dart';
import 'package:flutter_provider1/model/product_model.dart';
import 'package:flutter_provider1/model/shopping_cart.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  ProductModel model = ProductModel.init();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品列表"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/cart');
              },
              icon: const Icon(Icons.shopping_cart)
          )
        ],
      ),
      body:
      // Container(),
      ListView.builder(itemCount: model.list.length,itemBuilder: (context,index){
        bool isInCart = Provider.of<ShoppingCart>(context).cart.any((element) => element == model.list[index]);
        return ListTile(
          leading: Image.network(
            'https://img1.baidu.com/it/u=1147116283,1048004671&fm=253&fmt=auto&app=138&f=JPG?w=499&h=312',
            width: 100,),
          title: Text('${model.list[index].name}'),
          trailing: isInCart? const Icon(Icons.check): IconButton(icon: Icon(Icons.add) ,onPressed: (){
            Provider.of<ShoppingCart>(context,listen: false).add(model.list[index]);
          },),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Provider.of<ShoppingCart>(context,listen: false).removeAll();
      },
      child: Text('${Provider.of<ShoppingCart>(context).cart.length}'),),
    );
  }
}
