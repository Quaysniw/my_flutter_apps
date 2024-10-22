import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketapp/pages/home_page.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(
              left:80.0, right:80, bottom:80, top: 160),
            child: Image.asset('lib/images/avocado.png'),
          ),

          // siparişlerinizi kapınıza kadar getiriyouz
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Siparişlerinizi kapınıza kadar getiriyouz",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              
              ),
            ),
          ),

          const SizedBox(height: 24),
          // her gün taze ürünler
          Text(
            "Her gün taze ürünler",
          ),

          const Spacer(),

          // başla butonu
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(24),
                child: const Text(
                  "Başla",
                  style: TextStyle(color: Colors.white),)
              ),
            ),
          )
        ],
      ),
    );
  }
}