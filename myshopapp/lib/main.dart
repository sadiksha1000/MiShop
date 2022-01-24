import 'package:flutter/material.dart';
import 'package:myshopapp/home.dart';
import 'package:myshopapp/providers/auth.dart';
import 'package:myshopapp/providers/cart.dart';
import 'package:myshopapp/providers/orders.dart';
import 'package:myshopapp/providers/product.dart';
import 'package:myshopapp/screens/cart_screen.dart';
import 'package:myshopapp/screens/edit_product_screen.dart';
import 'package:myshopapp/screens/orders_screen.dart';
import 'package:myshopapp/screens/product_detail_screen.dart';
import 'package:myshopapp/screens/products_overview_screen.dart';
import 'package:myshopapp/screens/user_products_screen.dart';
import './providers/products_provider.dart';
import 'package:provider/provider.dart';
import './widgets/app_drawer.dart';
import './screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Auth(),
        )
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
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
          home: auth.isAuthenticated ? ProductsOverviewScreen() : AuthScreen(),
          routes: {
            // '/': (context) => ProductsOverviewScreen(),
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductsScreen.routeName: (context) => UserProductsScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
