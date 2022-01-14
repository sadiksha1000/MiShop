import 'package:flutter/material.dart';
import 'package:myshopapp/providers/orders.dart';
import 'package:myshopapp/widgets/app_drawer.dart';
import 'package:myshopapp/widgets/order_item.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, index) => OrderItemWidget(
                order: orderData.orders[index],
              )),
    );
  }
}
