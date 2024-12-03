import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String image;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            Image.asset(image, height: 200),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: $price",
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
