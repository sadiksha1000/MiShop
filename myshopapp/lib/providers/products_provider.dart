import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshopapp/models/http_exception.dart';
import 'package:provider/provider.dart';

import 'dart:convert';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //     id: 'p1',
    //     title: 'Red Shirt',
    //     description: 'A red shirt- Pretty nice',
    //     price: 29.99,
    //     imageUrl:
    //         'https://news.cgtn.com/news/2021-04-25/2021-World-Penguin-Day-Star-of-Antarctica-ZK4w70wnew/img/f0cad53c56784c59bc941418b953f00c/f0cad53c56784c59bc941418b953f00c-1920.jpeg'),
    // Product(
    //     id: 'p2',
    //     title: 'Red Skirt',
    //     description: 'A red skirt- Pretty nice',
    //     price: 19.99,
    //     imageUrl:
    //         'https://news.cgtn.com/news/2021-04-25/2021-World-Penguin-Day-Star-of-Antarctica-ZK4w70wnew/img/f0cad53c56784c59bc941418b953f00c/f0cad53c56784c59bc941418b953f00c-1920.jpeg'),
    // Product(
    //     id: 'p3',
    //     title: 'Chocolates',
    //     description: 'Hungry',
    //     price: 50,
    //     imageUrl:
    //         'https://news.cgtn.com/news/2021-04-25/2021-World-Penguin-Day-Star-of-Antarctica-ZK4w70wnew/img/f0cad53c56784c59bc941418b953f00c/f0cad53c56784c59bc941418b953f00c-1920.jpeg'),
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

  Future<void> fetchAndSetProducts() async {
    const url =
        'https://mishop-ca657-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((productId, productData) {
        loadedProducts.add(Product(
          id: productId,
          title: productData['title'],
          description: productData['description'],
          price: productData['price'],
          isFavorite: productData['isFavorite'],
          imageUrl: productData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    const url =
        'https://mishop-ca657-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'isFavorite': product.isFavorite
          }));
      final newProduct = Product(
        title: product.title,
        description: product.description,
        id: json.decode(response.body)['name'],
        price: product.price,
        imageUrl: product.imageUrl,
      );

      _items.add(newProduct);
      // _items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
      print(error);
    }
  }

  Future<void> updateProduct(Product newProduct, String id) async {
    final prodIndex = _items.indexWhere((product) => product.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://mishop-ca657-default-rtdb.firebaseio.com/products/$id.json';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('....');
    }
  }

  void deleteProduct(String id) {
    final url =
        'https://mishop-ca657-default-rtdb.firebaseio.com/products/$id.json';
    final existingProductIndex =
        _items.indexWhere((product) => product.id == id);
    Product? existingProduct = _items[existingProductIndex];
    http.delete(Uri.parse(url)).then((response) {
      if (response.statusCode >= 400) {
        throw HttpException('Could not delete product!');
      }
      existingProduct = null;
    }).catchError((_) {
      _items.insert(existingProductIndex, existingProduct!);
    });
    _items.removeAt(existingProductIndex);
    notifyListeners();
  }
}
