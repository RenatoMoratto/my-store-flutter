import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class OrderDetails extends StatelessWidget {
  final CartItem product;

  const OrderDetails(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${product.quantity}x R\$ ${product.price}',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
