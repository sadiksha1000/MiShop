import 'package:flutter/material.dart';
import 'package:myshopapp/home.dart';
import 'package:myshopapp/screens/product_detail_screen.dart';
import 'package:myshopapp/screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            accentColor: Colors.lightBlue,
            fontFamily: 'Lato',
            textTheme: TextTheme(
              headline4: TextStyle(fontSize: 23, fontFamily: 'Lato-Bold'),
              bodyText2: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Lato-Regular',
              ),
            ),
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          }),
    );
  }
}
