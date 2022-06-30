import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  const OrderWidget(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text('R\$ ${order.total.toStringAsFixed(2)}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(order.date),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.expand_more),
      ),
    ));
  }
}