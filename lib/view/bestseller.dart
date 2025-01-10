import 'package:flutter/material.dart';

class Bestseller extends StatelessWidget {
  const Bestseller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Bagian Scrollable (Konten Produk)
          Padding(
            padding: const EdgeInsets.only(
                top: 100), // Beri ruang untuk header tetap
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProductCard(
                          image: "assets/images/produk2.png",
                          title: "RC Kitten",
                          price: "Rp. 12.000",
                        ),
                        _buildProductCard(
                          image: "assets/images/produk3.png",
                          title: "RC Persian",
                          price: "Rp. 15.000",
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProductCard(
                          image: "assets/images/produk4.png",
                          title: "Premium Adult",
                          price: "Rp. 72.000",
                        ),
                        _buildProductCard(
                          image: "assets/images/produk5.png",
                          title: "Me-O Creamy",
                          price: "Rp. 20.000",
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProductCard(
                          image: "assets/images/produk6.png",
                          title: "Me-O Tuna Adult",
                          price: "Rp. 32.000",
                        ),
                        _buildProductCard(
                          image: "assets/images/produk7.png",
                          title: "Whiskas",
                          price: "Rp. 9.000",
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProductCard(
                          image: "assets/images/produk9.png",
                          title: "Tas Astronot",
                          price: "Rp. 98.000",
                        ),
                        _buildProductCard(
                          image: "assets/images/produk8.png",
                          title: "Kalung Kucing",
                          price: "Rp. 12.000",
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProductCard(
                          image: "assets/images/produk10.png",
                          title: "Cat Tree",
                          price: "Rp. 99.999",
                        ),
                        _buildProductCard(
                          image: "assets/images/produk11.png",
                          title: "Cat Teaser Stick",
                          price: "Rp. 20.000",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bagian Tetap (Header)
          Container(
            height: 100,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 45),
            color: Colors.white, // Background tetap putih agar tidak transparan
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x11000000),
                          blurRadius: 20,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  "Best Seller",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String title,
    required String price,
  }) {
    return Container(
      width: 156,
      height: 220,
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F7F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 142,
            height: 142,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1A1919),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Tambahkan logika aksi "plus"
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7140FC),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
