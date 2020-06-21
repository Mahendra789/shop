import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;
  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItems(String productId, double price,  String title, int quantity, ) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: quantity+1,
          price: price,
        ),);
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
  }
}
