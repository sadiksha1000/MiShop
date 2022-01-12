import 'package:flutter/material.dart';
import 'package:myshopapp/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;

  const ProductItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(title, style: Theme.of(context).textTheme.bodyText2),
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              iconSize: 20,
              color: Theme.of(context).accentColor,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              iconSize: 20,
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}
