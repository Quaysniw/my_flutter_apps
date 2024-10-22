import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiapp/components/button.dart';
import 'package:sushiapp/components/food_tile.dart';
import 'package:sushiapp/main.dart';
import 'package:sushiapp/models/food.dart';
import 'package:sushiapp/models/shop.dart';
import 'package:sushiapp/pages/food_details_page.dart';
import 'package:sushiapp/theme/colors.dart';
import 'package:provider/provider.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // yemekleirn ayrıntı sayfasına yönlendirme
  void navigateToFoodDetails(int index) {

    // get the shop and it's menu, mağazayı ve menüsünü al
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu, mağazayı ve menüsünü al
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: const Text('Tokyo'),
        actions: [
          // sepet butonu
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
            )
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promosyon banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
              ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promosyon mesajı
                    Text(
                      '%32 İNDİRİM SENİ BEKLİYOR',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // fırsat butonu
                    MyButton(
                      text: "Acele Et",
                      onTap: () {}
                    ),
                  ],
                ),

                // image
                Image.asset('assets/images/many_sushi.png',
                height: 80,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // arama çubuğu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Yemeğini ara..",
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // menü listesi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Yemek Menüsü',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length, //> 100 ? 100 : foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 25),
          
          // popüler yemekler
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'assets/images/salmon_eggs.png',
                      height: 50,
                    ),

                    const SizedBox(width: 20),

                    // isim ve fiyat
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // isim
                        Text("Somon Yumurtası",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(height: 10),

                        // fiyat
                        Text(
                         '21.00\₺',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),

                // kalp
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),

              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}