import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../exceptions/http_exception.dart';
import '../utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite(String token) async {
    _toggleFavorite();
    final response = await http.patch(
      Uri.parse('${Constants.productBaseUrl}/$id.json?auth=$token'),
      body: jsonEncode({"isFavorite": isFavorite}),
    );

    if (response.statusCode >= 400) {
      _toggleFavorite();
      throw HttpException(
        msg: 'Não foi possível favoritar o produto',
        statusCode: response.statusCode,
      );
    }
  }
}
