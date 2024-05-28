import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String searchQuery = '';
  List<Product> searchResults = []; // Menyimpan hasil pencarian

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
            searchResults = searchProducts(value); // Memperbarui hasil pencarian
          });
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
List<Product> searchProducts(String query) {
    // Implementasi logika pencarian
    List<Product> searchResults = [];
    for (var product in allProducts) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        searchResults.add(product);
      }
    }
    return searchResults;
  }


class Product {
  final String name;
  // Tambahkan properti lain yang dibutuhkan

  Product(this.name);
}

// Daftar produk yang akan dicari
List<Product> allProducts = [
  Product("Rolex"),
  Product("Patek Phillipe"),
  Product("Richard Mille"),
  // Tambahkan produk lainnya
];

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
