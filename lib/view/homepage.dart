import 'package:flutter/material.dart';
import 'package:petshop/data/product_data.dart';
import 'package:petshop/view/product_detail.dart';
import 'package:petshop/view/search.dart';
import 'package:petshop/view/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _activeCategory = 'Food';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 46.0),
        child: Column(
          children: [
            // Baris Lokasi dan Ikon Search & Notifikasi
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Aksi ketika lokasi ditekan
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Choose Location"),
                        content:
                            const Text("Here you can choose a new location."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Close"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: Color(0xFFB3B1B0),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'Gamping, Yogyakarta',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/images/Arrow - Down.png',
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 16.0),
                        child: Image.asset(
                          'assets/images/search.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/images/notification.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 2),
            Container(
              width: 351,
              height: 206,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 37,
                    child: Container(
                      width: 327,
                      height: 139,
                      decoration: ShapeDecoration(
                        color: Color(0xFF7140FC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    top: 0,
                    child: Container(
                      width: 192,
                      height: 206,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 176,
                              height: 176,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/produk1.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 31,
                            top: 45,
                            child: Container(
                              width: 161,
                              height: 161,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/produk1.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 145,
                    top: 66,
                    child: SizedBox(
                      width: 141,
                      child: Text(
                        'Royal Canin\nAdult Pomeranian',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 145,
                    top: 116,
                    child: SizedBox(
                      width: 151,
                      child: Text(
                        'Get an interesting promo here, without conditions',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            Container(
              width: 327,
              height: 29,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 6,
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0.11,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 263,
                    top: 10,
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF7140FC),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 268,
              height: 47,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryButton('Food'),
                  _buildCategoryButton('Accessories'),
                  _buildCategoryButton('Toys'),
                ],
              ),
            ),
            // Best Seller
            const SizedBox(height: 20),
            Container(
              width: 327,
              height: 29,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 6,
                    child: Text(
                      'Best Seller',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0.11,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 263,
                    top: 10,
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF7140FC),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Produk
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 2.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Jumlah kolom
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              title: product.title,
                              price: product.price,
                              image: product.image,
                            ),
                          ),
                        );
                      },
                      child: _buildProductCard(
                        context,
                        title: product.title,
                        price: product.price,
                        image: product.image,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text("${product.title} added to cart!")),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // BottomNavigationBar yang sekarang berada di dalam Scaffold
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors
            .transparent, // Make the background transparent (or set your own)
        elevation: 0, // Optional: Remove shadow
        showSelectedLabels: false, // Hide the label of the selected item
        showUnselectedLabels: false, // Hide the label of the unselected items
        selectedItemColor: Color(0xFF7140FC), // Purple color for selected item
        // unselectedItemColor: Colors.black, // Color for unselected items
        type: BottomNavigationBarType
            .fixed, // Prevent animation when switching tabs
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Image.asset(
                    'assets/images/home_selected.png', // Selected icon
                    width: 24,
                    height: 24,
                  )
                : Image.asset(
                    'assets/images/home.png', // Default (unselected) icon
                    width: 24,
                    height: 24,
                  ),
            label: '', // Remove the label
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Image.asset(
                    'assets/images/cart_selected.png', // Selected icon
                    width: 24,
                    height: 24,
                  )
                : Image.asset(
                    'assets/images/cart.png', // Default (unselected) icon
                    width: 24,
                    height: 24,
                  ),
            label: '', // Remove the label
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Image.asset(
                    'assets/images/settings_selected.png', // Selected icon
                    width: 24,
                    height: 24,
                  )
                : Image.asset(
                    'assets/images/settings.png', // Default (unselected) icon
                    width: 24,
                    height: 24,
                  ),
            label: '', // Remove the label
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Image.asset(
                    'assets/images/profile_selected.png', // Selected icon
                    width: 24,
                    height: 24,
                  )
                : Image.asset(
                    'assets/images/profile.png', // Default (unselected) icon
                    width: 24,
                    height: 24,
                  ),
            label: '', // Remove the label
          ),
        ],
      ),
    );
  }

// Category
  Widget _buildCategoryButton(String category) {
    final bool isActive = _activeCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeCategory = category;
        });
      },
      child: Container(
        width: category == 'Accessories' ? 106 : 70,
        height: 47,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF7140FC) : const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
            width: 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: const Color(0x3F000000),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [], // Tidak ada bayangan jika tidak aktif
        ),
        alignment: Alignment.center,
        child: Text(
          category,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFFB3B1B0),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

// Card Produk
Widget _buildProductCard(
  BuildContext context, {
  required String title,
  required String price,
  required String image,
  required VoidCallback onPressed,
}) {
  return Container(
    width: 327,
    height: 210,
    child: Stack(
      children: [
        // Card Background
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 156,
            height: 210,
            decoration: ShapeDecoration(
              color: const Color(0xFFF7F7F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
        // Product Image (using AssetImage)
        Positioned(
          left: 7,
          top: 7,
          child: Container(
            width: 142,
            height: 142,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image), // Gambar lokal
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        // Product Information (Name and Price)
        Positioned(
          left: 12,
          top: 149,
          child: Container(
            width: 132,
            height: 49,
            child: Stack(
              children: [
                // Title
                Positioned(
                  left: 0,
                  top: 4,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF1A1919),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.13,
                    ),
                  ),
                ),
                // Price with "+" Icon next to it
                Positioned(
                  left: -1.5,
                  top: 10,
                  child: Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.07,
                        ),
                      ),
                      SizedBox(width: 3), // Spacing between price and icon
                      GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF7140FC),
                            shape: OvalBorder(),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
