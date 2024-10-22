import 'dart:convert';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items sale
  final List _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avokado", "8.90", "lib/images/avocado.png", Colors.green],
    ["Muz", "3.75", "lib/images/banana.png", Colors.yellow],
    ["Tüm Tavuk", "53.90", "lib/images/chicken.png", Colors.brown],
    ["1L Su", "10.00", "lib/images/water.png", Colors.blue],
  ];

  // sepetteki ürünlerin listesi

  List _cartItems = [];

  get shopItems => _shopItems;

  get cardItems => _cartItems;

  // sepete ürün ekleme
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // sepetten ürün çıkartma
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // toplam hesap
  String calculateTotal() {
    double totalPrice = 0;
  for (int i = 0; i < _cartItems.length; i++) {
    // Hangi veriyi işlediğimizi görmek için ekrana yazdıralım
    ('Item: ${_cartItems[i]}');
    ('Price: ${_cartItems[i][1]}');

    totalPrice += double.parse(_cartItems[i][1]);
  }
  return totalPrice.toStringAsFixed(2);
  }
}