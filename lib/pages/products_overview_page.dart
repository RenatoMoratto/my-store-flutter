import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_grid.dart';
import '../models/product.dart';
import '../models/product_list.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Minha Loja')),
      body: ProductGrid(loadedProducts: loadedProducts),
    );
  }
}
