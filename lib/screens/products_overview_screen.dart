import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products.dart';

enum DisplayOptions {
  ShowFavorites,
  ShowAll,
}

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // listen set to false is because we are only interested to access the function showFavorite() & showAll(). NOT to listen to products state
    final productContainer = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (DisplayOptions selectedValue) {
              print('selectedValue..... $selectedValue');

              if (selectedValue == DisplayOptions.ShowFavorites) {
                //
                productContainer.showFavorite();
              } else {
                //
                productContainer.showAll();
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Show Favorites'),
                value: DisplayOptions.ShowFavorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: DisplayOptions.ShowAll,
              )
            ],
          ),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
