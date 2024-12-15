import 'package:flutter/material.dart';
import 'payment_success.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String? selectedPaymentMethod; 

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
              left: 126,
              top: 82,
              child: Text(
                'Payment Method',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 60,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); 
                },
                child: Container(
                  width: 46,
                  height: 46,
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 700,
              child: GestureDetector(
                onTap: () {
                  if (selectedPaymentMethod != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PaymentSuccess()),
                    );
                  }
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
                            color: selectedPaymentMethod == null
                                ? Colors.grey
                                : Color(
                                    0xFF7140FC), 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.50),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 123,
                        top: 28,
                        child: Text(
                          'Checkout',
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
            Positioned(
              left: 24,
              top: 140,
              child: Text(
                'Choose your Payment Method',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                ),
              ),
            ),
            _buildPaymentOption('BRI', selectedPaymentMethod == 'BRI', 183),
            _buildPaymentOption('BNI', selectedPaymentMethod == 'BNI', 259),
            _buildPaymentOption('BCA', selectedPaymentMethod == 'BCA', 335),
            _buildPaymentOption('DANA', selectedPaymentMethod == 'DANA', 411),
            _buildPaymentOption(
                ' Shopeepay', selectedPaymentMethod == 'Shopeepay', 487),
            _buildPaymentOption('Gopay', selectedPaymentMethod == 'Gopay', 563),
          ],
        ),
      ),
    );
  }

  Positioned _buildPaymentOption(String bankName, bool isSelected, double top) {
    return Positioned(
      left: 24,
      top: top,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPaymentMethod =
                bankName; // Set metode pembayaran yang dipilih
          });
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
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color:
                            isSelected ? Color(0xFF7140FC) : Color(0xFFE5E4E3),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 27,
                child: Text(
                  bankName,
                  style: TextStyle(
                    color: isSelected ? Color(0xFF7140FC) : Color(0xFFB3B1B0),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                ),
              ),
              if (isSelected) // Menampilkan ikon lingkaran hanya jika metode pembayaran dipilih
                Positioned(
                  left: 285,
                  top: 19,
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
