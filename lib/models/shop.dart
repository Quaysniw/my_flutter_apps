import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier{
  // yemek menüsü
  final List<Food> _foodMenu = [
    // somon balığı
    Food(
      name: "Somonlu Sushi",
      price: "21.00",
      ImagePath: "assets/images/salmon_sushi.png",
      rating: "4.9",
      description: "İnce dilimlenmiş taze somon, mükemmel bir şekilde baharatlanmış sushi pirincinin üzerine zarifçe yerleştirilmiştir.",
    ),

    // ton balığı
    Food(
      name: "Ton Balıklı Sushi",
      price: "23.00",
      ImagePath: "assets/images/tuna.png",
      rating: "4.3",
      description: "Taze ve lezzetli ton balığı dilimleri, sushi pirinciyle mükemmel bir uyum içindedir.",
    ),
  ];

  // sepet
  List<Food> _cart = [];

  // alıcı metodlar
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // sepete ekle
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // sepetten çıkart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}