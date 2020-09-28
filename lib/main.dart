import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // there're 2 ways to use `ChangeNotifierProvider`:
      // 1) using `create: (ctx) => Products()`, OR,
      //    --> use when you instantiate (new instance) a class and provide that to
      //        ChangeNotifierProvider, we should use this approach! Just like this one!
      // 2) using value: Products()
      //    --> use when you use existing instance (you do not create new instance) to
      //        provide to ChangeNotifierProvider (e.g. just like in ProductsGrid widget)
      //        usually part of a List or Grid

      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
