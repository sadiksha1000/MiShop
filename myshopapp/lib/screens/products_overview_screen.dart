import 'package:flutter/material.dart';
import 'package:myshopapp/providers/cart.dart';
import 'package:myshopapp/providers/product.dart';
import 'package:myshopapp/providers/products_provider.dart';
import 'package:myshopapp/screens/cart_screen.dart';
import 'package:myshopapp/widgets/badge.dart';
import 'package:myshopapp/widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
// import '../widgets/product_item.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    // final product = Provider.of<Product>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          Flexible(
            child: Consumer<Cart>(
              builder: (_, cartData, ch) => Badge(
                child: ch as Widget,
                value: cartData.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                iconSize: 22,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ),
          Flexible(
            child: PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites),
                PopupMenuItem(
                    child: Text('Show All'), value: FilterOptions.All),
              ],
            ),
          ),
        ],
      ),
      body: ProductsGrid(showFavs: _showOnlyFavorites),
    );
  }
}
