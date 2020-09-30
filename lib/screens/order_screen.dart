import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order.dart' show Order;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => OrderItem(
          orderData.orders[index],
        ),
      ),
    );
  }
}
