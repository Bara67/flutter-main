import 'package:flutter/material.dart';
import 'package:shop_app/screens/products/products_screen.dart';

import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Featured Brands",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/Image banner 1.png",
                category: "Rolex",
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/Image banner 2.png",
                category: "Patek Philippe",
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/Image banner 3.png",
                category: "Patek Philippe",
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.press,
  });

  final String category, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
