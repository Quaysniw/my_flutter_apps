import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiapp/components/button.dart';
import 'package:sushiapp/main.dart';
import 'package:sushiapp/models/food.dart';
import 'package:sushiapp/models/shop.dart';
import 'package:sushiapp/theme/colors.dart';
import 'package:provider/provider.dart';


class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({
    super.key,
    required this.food,
    });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // miktar
  int quantityCount = 0;

  // miktar azalt
  void decrementQuantity() {
    setState(() {
      if(quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // miktar çoğalt
  void incrementQuantity() {
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  // sepete ekle
  void addToCart() {
    // only add to cart if there is something in the cart, sepette bir şey varsa yalnızca sepete ekle
    if (quantityCount > 0) {
      // get acces to shop, mağazaya erişim sağla 
      final shop = context.read<Shop>();

      // sepete ekle
      shop.addToCart(widget.food, quantityCount);

      // spete eklendi mesajı
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: const Text(
            "Sepete başarıyla eklendi",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            // tamam butonu
            IconButton(onPressed: () {

              // pop once to remove dialog box,dialog kutusunu kaldırmak için bir kez geri al
              Navigator.pop(context);
              
              // pop again to go previos screen, önceki ekrana gitmek için tekrar geri al
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.done,
              color: Colors.white,
            ),
            )
          ],
        ),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // yemek ayrıntılarının liste görünümü
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // image
                  Image.asset(
                    widget.food.ImagePath,
                    height: 200,
                  ),
              
                  const SizedBox(height: 25),
              
                  // popülerlik
                  Row(
                    children: [
                      // yıldız icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
              
                      const SizedBox(width: 5),
                      
                      // popülerlik puanı
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
              
                  // yemek adı
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  const SizedBox(height: 20),
              
                  // tanım
                  Text(
                    "Açıklama",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  
                  const SizedBox(height: 10),

                  Text(
                    widget.food.description,
                    style: TextStyle(color: Colors.grey[900],
                    fontSize: 14,
                    height: 2,
                    ),
                  )
                ],
              ),
            ),
          ),

          // fiyat + miktar + sepete ekle butonu
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                // fiyat + miktar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // fiyat
                    Text(
                      "${widget.food.price}\₺",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    // miktar
                    Row(
                      children: [
                        // çıkart butonu
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                            ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),


                        // miktar hesaplama
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),


                        // ekle buton
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                            ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // sepete ekle buton
                MyButton(
                  text: "Sepete ekle",
                  onTap: addToCart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}