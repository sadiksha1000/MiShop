import 'package:flutter/material.dart';
import 'package:myshopapp/providers/cart.dart';
import 'package:myshopapp/providers/product.dart';
import 'package:myshopapp/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String title;
  // final String id;
  // final String imageUrl;

  // const ProductItem({
  //   Key? key,
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: FittedBox(
              child: Text(
                product.title,
                style: TextStyle(
                  fontSize: 1,
                ),
              ),
            ),
            leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                iconSize: 22,
                color: Theme.of(context).accentColor,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(
                    product.id as String, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Added Item to the Cart!',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  duration: Duration(
                    seconds: 2,
                  ),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id as String);
                    },
                  ),
                ));
              },
              iconSize: 22,
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}
