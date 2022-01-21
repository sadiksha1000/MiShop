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
            'https://news.cgtn.com/news/2021-04-25/2021-World-Penguin-Day-Star-of-Antarctica-ZK4w70wnew/img/f0cad53c56784c59bc941418b953f00c/f0cad53c56784c59bc941418b953f00c-1920.jpeg'),
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

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      id: DateTime.now().toString(),
      price: product.price,
      imageUrl: product.imageUrl,
    );

    _items.add(newProduct);
    _items.insert(0, newProduct);
    notifyListeners();
  }

  void updateProduct(Product newProduct, String id) {
    final prodIndex = _items.indexWhere((product) => product.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('....');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
