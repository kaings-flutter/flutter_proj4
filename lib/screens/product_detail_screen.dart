import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    // since ProductDetailScreen also a child of MyApp widget, we can listen to Products state
    final loadedProduct = Provider.of<Products>(context, listen: false).findById(
        productId); // set `listen` to false: this widget won't rebuild even there is changes in Products state. When `listen` is set to `false`, it will ONLY listen for ONCE only!! (NOT ACTIVE LISTENER)

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
