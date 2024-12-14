import 'package:flutter/material.dart';
import 'package:petshop/models/product_model.dart';
import 'package:petshop/view/payment_method.dart'; // Pastikan untuk mengimpor halaman PaymentMethod

class Cart extends StatefulWidget {
  final List<Product> cartItems; // Mengambil cartItems yang dikirimkan

  Cart({required this.cartItems});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // Menghitung total harga
    double totalPrice = 0.0;
    for (var product in widget.cartItems) {
      // Menghapus "Rp." dan mengubah string menjadi double
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
                          onPressed: () {
                            // Hapus produk dari cartItems
                            setState(() {
                              widget.cartItems.removeAt(index);
                            });
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
                      padding: EdgeInsets.symmetric(horizontal: 100 ,vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      // Navigasi ke halaman metode pembayaran
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PaymentMethod()), // Ganti dengan halaman PaymentMethod
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
    );
  }
}
