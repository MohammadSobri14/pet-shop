import 'package:flutter/material.dart';
import 'package:petshop/view/homepage.dart';
import 'package:petshop/view/login.dart';
import 'package:petshop/view/security.dart'; // Impor halaman Security

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Fungsi untuk menyimpan data keranjang (Pastikan fungsi ini sudah diimplementasikan)
  Future<void> saveCartToLocalStorage() async {
    // Simulasi penyimpanan data
    print("Data keranjang disimpan ke local storage");
  }

  Widget buildOptionItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Opacity(
                opacity: 0.50,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7E7E7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 16), // Jarak antara ikon dan teks
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size: 16,
            ),
            onPressed: onTap, // Memanggil fungsi onTap saat ditekan
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 54, left: 34, right: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
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
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 66),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            buildOptionItem(Icons.person_outline, "Account", () {}),
            buildOptionItem(Icons.home_outlined, "Address", () {}),
            buildOptionItem(Icons.privacy_tip_outlined, "Privacy", () {}),
            buildOptionItem(Icons.vpn_key_outlined, "Security", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Security()),
              );
            }),
            const SizedBox(height: 24),
            const Text(
              'Help',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            buildOptionItem(Icons.call_outlined, "Contact Us", () {}),
            buildOptionItem(Icons.insert_comment_outlined, "FAQ", () {}),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () async {
                  await saveCartToLocalStorage(); // Simpan data keranjang sebelum logout
                  // Implementasi logout di sini
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF7140FC)),
                      borderRadius: BorderRadius.circular(30.50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Log Out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7140FC),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
