import 'package:flutter/material.dart';
import 'package:petshop/data/product_data.dart';
import 'package:petshop/models/product_model.dart';
import 'package:petshop/view/cart.dart';
import 'package:petshop/view/product_detail.dart';
import 'package:petshop/view/search.dart';
import 'package:petshop/view/notification.dart';
import 'package:petshop/view/bestseller.dart';

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
            _buildLocationAndSearchRow(),
            const SizedBox(height: 2),
            _buildPromoCard(),
            const SizedBox(height: 0),
            _buildCategoryHeader(),
            const SizedBox(height: 5),
            _buildCategoryButtons(),
            const SizedBox(height: 20),
            _buildBestSellerHeader(),
            const SizedBox(height: 10),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildLocationAndSearchRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          // onTap: () => _showLocationDialog(),
          child: _buildLocationInfo(),
        ),
        const Spacer(),
        _buildSearchAndNotificationIcons(),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(
            color: const Color(0xFFB3B1B0),
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
    );
  }

  Widget _buildSearchAndNotificationIcons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
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
              MaterialPageRoute(builder: (context) => NotificationPage()),
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
    );
  }

  Widget _buildPromoCard() {
    return Container(
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
                color: const Color(0xFF7140FC),
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
                          image: AssetImage("assets/images/produk1.png"),
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
                          image: AssetImage("assets/images/produk1.png"),
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
    );
  }

  Widget _buildCategoryHeader() {
    return Container(
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
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Container(
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
    );
  }

  Widget _buildBestSellerHeader() {
    return Container(
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bestseller()),
                );
              },
              child: Text(
                'View All',
                style: TextStyle(
                  color: const Color(0xFF7140FC),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return Expanded(
      child: SingleChildScrollView(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 2.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
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
                      onAddToCart: () {
                        setState(() {
                          cartItems
                              .add(product); // Menambahkan produk ke keranjang
                        });
                      },
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
                  setState(() {
                    cartItems.add(product); // Menambahkan produk ke keranjang
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${product.title} added to cart!"),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Cart(cartItems: cartItems), // Kirim data keranjang ke Cart
            ),
          ).then((_) {
            // Set _selectedIndex kembali ke 0 (Home) saat kembali dari Cart
            setState(() {
              _selectedIndex = 0;
            });
          });
        }
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color(0xFF7140FC),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: _selectedIndex == 0
              ? Image.asset(
                  'assets/images/home_selected.png',
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  'assets/images/home.png',
                  width: 24,
                  height: 24,
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 1
              ? Image.asset(
                  'assets/images/cart_selected.png',
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  'assets/images/cart.png',
                  width: 24,
                  height: 24,
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 2
              ? Image.asset(
                  'assets/images/settings_selected.png',
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  'assets/images/settings.png',
                  width: 24,
                  height: 24,
                ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: _selectedIndex == 3
              ? Image.asset(
                  'assets/images/profile_selected.png',
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  'assets/images/profile.png',
                  width: 24,
                  height: 24,
                ),
          label: '',
        ),
      ],
    );
  }

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
              : [],
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

// Daftar untuk menyimpan produk yang ada di keranjang
List<Product> cartItems = [];

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
        Positioned(
          left: 7,
          top: 7,
          child: Container(
            width: 142,
            height: 142,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          left: 12,
          top: 149,
          child: Container(
            width: 132,
            height: 49,
            child: Stack(
              children: [
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
                      const SizedBox(width: 3),
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
