import 'package:flutter/material.dart';

class Konsultasi extends StatefulWidget {
  const Konsultasi({super.key});

  @override
  State<Konsultasi> createState() => _KonsultasiState();
}

class _KonsultasiState extends State<Konsultasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/development.gif'),  // Menampilkan gambar GIF
            SizedBox(height: 20),  // Memberi jarak antara gambar dan teks
            Text("Dalam Tahap Development", style: TextStyle(fontSize: 18)),
            Text("Sabarrr Boosss!!", style: TextStyle(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
