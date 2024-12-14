import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final VoidCallback onAddToCart; // Callback untuk menambahkan ke keranjang

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.onAddToCart, // Tambahkan parameter ini
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header dengan Title
          Positioned(
            left: 133,
            top: 72,
            child: Text(
              'Product Detail',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // Tombol Kembali
          Positioned(
            left: 24,
            top: 60,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 46,
                height: 46,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: [
                    const BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 20,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),

          // Gambar Produk dari Assets
          Positioned(
            left: 24,
            top: 130,
            child: Container(
              width: 327,
              height: 311,
              decoration: ShapeDecoration(
                color: const Color(0xFFF7F7F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Nama Produk
          Positioned(
            left: 24,
            top: 465,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Deskripsi Produk
          Positioned(
            left: 24,
            top: 499,
            child: SizedBox(
              width: 327,
              child: const Text(
                'The Persian cat has the longest and densest coat of all cat breeds. '
                'This means that it typically needs to consume more skin-health focused nutrients '
                'than other cat breeds. That’s why ROYAL CANIN® Persian Adult contains an exclusive complex '
                'of nutrients to help the skin’s barrier defence role to maintain good skin and coat health.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFFB3B1B0),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          // Harga Produk
          Positioned(
            left: 237,
            top: 654,
            child: Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Tombol Tambah ke Keranjang ```dart
          Positioned(
            left: 24,
            top: 728,
            child: GestureDetector(
              onTap: () {
                onAddToCart(); // Panggil callback saat tombol ditekan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$title added to cart!"),
                  ),
                );
              },
              child: Container(
                width: 327,
                height: 60,
                decoration: ShapeDecoration(
                  color: const Color(0xFF7140FC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.50),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Add to Cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
