

import 'package:flutter/material.dart';
import 'package:flutter_provider1/model/shopping_cart.dart';
import 'package:flutter_provider1/page/product_list_page.dart';
import 'package:flutter_provider1/page/shopping_cart_page.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
      ChangeNotifierProvider(
          create: (context)=>ShoppingCart(),
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes:{
        '/':(context) => const ProductListPage(),
        '/cart':(context) => const ShoppingCarPage(),
      } ,
    );
  }
}