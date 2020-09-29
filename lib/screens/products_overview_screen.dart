import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum DisplayOptions {
  ShowFavorites,
  ShowAll,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (DisplayOptions selectedValue) {
              print('selectedValue..... $selectedValue');

              setState(() {
                if (selectedValue == DisplayOptions.ShowFavorites) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
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
      body: ProductsGrid(_showFavoriteOnly),
    );
  }
}
