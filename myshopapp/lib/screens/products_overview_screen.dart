import 'package:flutter/material.dart';
import 'package:myshopapp/widgets/products_grid.dart';
import '../widgets/products_grid.dart';
// import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: ProductsGrid(),
    );
  }
}
