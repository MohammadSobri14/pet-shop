import 'package:flutter/material.dart';
import 'package:petshop/models/product_model.dart';
import 'package:petshop/view/homepage.dart';
import 'package:petshop/view/konsultasi.dart';
import 'package:petshop/view/payment_method.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petshop/view/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  final List<Product> cartItems; // Mengambil cartItems yang dikirimkan
  final int userId; // Menambahkan userId

  Cart({required this.cartItems, required this.userId});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedIndex = 1;

  // Fungsi untuk menyimpan data keranjang ke SharedPreferences
  Future<void> saveCartToLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartData = widget.cartItems
        .map((item) => json.encode({
              'title': item.title,
              'price': item.price,
              'image': item.image,
            }))
        .toList();
    await prefs.setStringList('cart_${widget.userId}', cartData);
  }

// Fungsi untuk memuat data keranjang dari SharedPreferences
  Future<void> loadCartFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartData = prefs.getStringList('cart_${widget.userId}');
    if (cartData != null) {
      setState(() {
        widget.cartItems.clear();
        widget.cartItems.addAll(cartData.map((item) {
          Map<String, dynamic> data = json.decode(item);
          return Product(
            title: data['title'],
            price: data['price'],
            image: data['image'],
          );
        }).toList());
      });
    }
  }

// Fungsi untuk menghapus data keranjang dari SharedPreferences
  Future<void> clearCartFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart_${widget.userId}');
  }

  @override
  Widget build(BuildContext context) {
    // Menghitung total harga
    double totalPrice = 0.0;
    for (var product in widget.cartItems) {
      String priceString =
          product.price.replaceAll('Rp. ', '').replaceAll('.', '');
      totalPrice += double.tryParse(priceString) ?? 0.0;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? Center(child: Text('No items in the cart'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = widget.cartItems[index];
                      return ListTile(
                        leading: Image.asset(product.image),
                        title: Text(product.title),
                        subtitle: Text(product.price),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            setState(() {
                              widget.cartItems.removeAt(index);
                            });
                            await saveCartToLocalStorage(); // Simpan perubahan ke lokal storage
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("${product.title} removed from cart!"),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Menampilkan jumlah total produk dan total harga
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.cartItems.length} Items',
                        style: TextStyle(
                          color: Color(0xFFB3B1B0),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Total Price: Rp. ${totalPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Tombol Checkout
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7140FC), // Warna tombol
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () async {
                      await checkout(widget.userId);
                      await clearCartFromLocalStorage(); // Hapus data keranjang setelah checkout
                      setState(() {
                        widget.cartItems.clear();
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentMethod()),
                      );
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
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

  Future<void> addToCart(int userId, int productId, int quantity) async {
    final url = Uri.parse(
        'http://192.168.18.200:5000/cart'); // Ganti dengan URL server Anda jika diperlukan

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'user_id': userId,
        'product_id': productId,
        'quantity': quantity,
      }),
    );

    if (response.statusCode == 201) {
      // Berhasil menambahkan produk ke keranjang
      print('Product added to cart: ${response.body}');
    } else {
      // Gagal menambahkan produk
      print('Failed to add product: ${response.body}');
    }
  }

  Future<void> checkout(int userId) async {
    final url = Uri.parse(
        'http://192.168.18.200:5000/checkout'); // Ganti dengan URL server Anda jika diperlukan

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'user_id': userId,
      }),
    );

    if (response.statusCode == 200) {
      // Berhasil melakukan checkout
      print('Checkout successful: ${response.body}');
    } else {
      // Gagal melakukan checkout
      print('Failed to checkout: ${response.body}');
    }
  }
}
