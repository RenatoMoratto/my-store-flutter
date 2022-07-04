import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/app_routes.dart';
import 'models/cart.dart';
import 'models/auth.dart';
import 'models/order_list.dart';
import 'models/product_list.dart';
import 'pages/product_details_page.dart';
import 'pages/products_page.dart';
import 'pages/auth_or_home_page.dart';
import 'pages/cart_page.dart';
import 'pages/orders_page.dart';
import 'pages/product_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Lato',
      primarySwatch: Colors.purple,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.deepOrange,
          ),
        ),
        routes: {
          AppRoutes.authOrHome: (context) => const AuthOrHomePage(),
          AppRoutes.productDetail: (context) => const ProductDetailPage(),
          AppRoutes.cart: (context) => const CartPage(),
          AppRoutes.orders: (context) => const OrdersPage(),
          AppRoutes.products: (context) => const ProductsPage(),
          AppRoutes.productForm: (context) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
