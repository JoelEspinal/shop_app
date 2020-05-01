import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FavoriteOption { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyShop'),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FavoriteOption selectedValue) {
                  if (selectedValue == FavoriteOption.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Only Favorites'),
                        value: FavoriteOption.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FavoriteOption.All,
                      ),
                    ]),
          ],
        ),
        body: ProductGrid(_showOnlyFavorites));
  }
}
