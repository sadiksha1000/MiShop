import 'package:flutter/material.dart';
import 'package:myshopapp/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('Hello Friend!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.shop,
          ),
          title: Text(
            'Shop',
            style: Theme.of(context).textTheme.headline4,
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.payment,
          ),
          title: Text(
            'Orders',
            style: Theme.of(context).textTheme.headline4,
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
        ),
      ],
    ));
  }
}
