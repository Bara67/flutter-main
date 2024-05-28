import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 70,
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 50, 137, 152),
        borderRadius: BorderRadius.circular(20),
        // Menambahkan gambar sebagai latar belakang
        image: const DecorationImage(
          image: AssetImage('assets/images/banner2.png'),
          fit: BoxFit.cover, // Opsional, menyesuaikan gambar ke dalam kotak
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "New Collections in 2024",
            textAlign: TextAlign.center,
            style: TextStyle(
              
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Happy Shopping",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}