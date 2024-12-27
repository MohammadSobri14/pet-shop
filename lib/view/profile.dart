import 'package:flutter/material.dart';
import 'package:petshop/view/cart.dart';
import 'package:petshop/view/homepage.dart';
import 'package:petshop/view/konsultasi.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 3; // Profile sebagai menu awal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 50),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 54,
                      top: 4,
                      child: Container(
                        width: 114,
                        height: 37,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7140FC),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Center(
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacing between header and content

            // Cover with Profile Photo
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Cover Image
                Container(
                  width: double.infinity,
                  height: 159,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFD9340),
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/background_profile.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Photo
                Positioned(
                  top: 110, // Adjust to control how deep it is inside the cover
                  left: MediaQuery.of(context).size.width / 2 - 65, // Centering
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/foto_profile.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              "Abdul Dudul",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                height: 1.50,
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 193,
                height: 47,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 78,
                        height: 47,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        decoration: ShapeDecoration(
                          color: Color(0xFF7140FC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saved',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 0,
                      child: Container(
                        width: 103,
                        height: 47,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF7F7F7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Color(0xFFB3B1B0),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 156,
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
                        color: Color(0xFFF7F7F7),
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
                          image: AssetImage("assets/images/produk1.png"),
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
                            top: 0,
                            child: Container(
                              width: 100,
                              height: 49,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Text(
                                      'RC Kitten',
                                      style: TextStyle(
                                        color: Color(0xFF1A1919),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 1.60,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 19,
                                    child: Text(
                                      'Rp. 12.000',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            top: 19,
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF7140FC),
                                        shape: OvalBorder(),
                                      ),
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Icon(Icons.add,
                                            color: Colors.white, size: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type:
          BottomNavigationBarType.fixed, // Menjamin jarak antar menu sama rata
      currentIndex: _selectedIndex,
      onTap: (index) {
        if (index != _selectedIndex) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()), // Halaman Home
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Cart(cartItems: [], userId: 15)), // Halaman Cart
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Konsultasi()), // Halaman Settings
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Profile()), // Halaman Profile
              );
              break;
          }
        }
      },
      elevation: 8,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color(0xFF7140FC),
      unselectedItemColor: const Color(0xFFB3B1B0),
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
                  'assets/images/konsultasi_selected.png',
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  'assets/images/konsultasi.png',
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
}
