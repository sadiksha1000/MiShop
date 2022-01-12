import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt- Pretty nice',
        price: 29.99,
        imageUrl:
            'https://news.cgtn.com/news/2021-04-25/2021-World-Penguin-Day-Star-of-Antarctica-ZK4w70wnew/img/f0cad53c56784c59bc941418b953f00c/f0cad53c56784c59bc941418b953f00c-1920.jpeg'),
    Product(
        id: 'p2',
        title: 'Red Skirt',
        description: 'A red skirt- Pretty nice',
        price: 19.99,
        imageUrl:
            'https://news.cgtn.com/news/2021-04-25/2021-World-Penguin-Day-Star-of-Antarctica-ZK4w70wnew/img/f0cad53c56784c59bc941418b953f00c/f0cad53c56784c59bc941418b953f00c-1920.jpeg'),
    Product(
        id: 'p3',
        title: 'Chocolates',
        description: 'Hungry',
        price: 50,
        imageUrl:
            'https://news.cgtn.com/news/2021-04-25/2021-World-Penguin-Day-Star-of-Antarctica-ZK4w70wnew/img/f0cad53c56784c59bc941418b953f00c/f0cad53c56784c59bc941418b953f00c-1920.jpeg')
  ];
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
      body: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: loadedProducts.length,
        itemBuilder: (context, index) => ProductItem(
          id: loadedProducts[index].id,
          title: loadedProducts[index].title,
          imageUrl: loadedProducts[index].imageUrl,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
