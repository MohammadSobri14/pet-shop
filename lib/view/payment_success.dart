import 'package:flutter/material.dart';
import 'homepage.dart'; // Pastikan untuk mengimpor halaman utama Anda

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 24,
              top: 90,
              child: SizedBox(
                width: 331,
                child: Text(
                  'Payment Success!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.13,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 234,
              child: SizedBox(
                width: 327,
                child: Text(
                  'Your order is being prepared by the shop, the courier will send it to your address.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xFF898989),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.11,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 700,
              child: GestureDetector(
                onTap: () {
                  // Navigasi ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage()), // Ganti dengan nama halaman utama Anda
                  );
                },
                child: Container(
                  width: 327,
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 327,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Color(0xFF7140FC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 130,
                        top: 30,
                        child: Text(
                          'Go Home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.11,
                          ),
                        ),
                      ),
                    ],
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
