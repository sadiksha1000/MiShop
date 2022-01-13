import 'package:flutter/material.dart';
import 'product.dart';
import 'package:provider/provider.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
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

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((product) => product.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
