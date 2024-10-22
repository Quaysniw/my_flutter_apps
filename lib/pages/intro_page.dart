import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiapp/components/button.dart';
import 'package:sushiapp/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
        
            // mağaza adı
            Text(
              "BATU'S SUSHI",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),


            // icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('assets/images/salmon_eggs.png'),
            ),

            const SizedBox(height: 25),
        
            // başlık
            Text(
              "JAPON YEMEKLERİNİN LEZZETİ",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),
        
            // altbaşlık
            Text(
              "En popüler Japon yemeklerinin lezzetini her zaman ve her yerden deneyimleyin",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            const SizedBox(height: 25),
        
            // başla buton
            MyButton(
              text: "Başla",
              onTap: () {
                // menü sayfası yönlendirme
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}