import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

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
                setState(() {
                  if (selectedValue == FavoriteOption.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
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
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: ProductGrid(_showOnlyFavorites));
  }
}
