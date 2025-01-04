import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:petshop/view/homepage.dart';
import 'package:petshop/view/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isFullNameValid = false;
  bool _isPasswordObscured = true;
  bool _isAgreed = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to validate email and password
  void _validateForm() {
    setState(() {
      _isFullNameValid = _fullNameController.text.isNotEmpty;
      _isEmailValid = _emailController.text.contains('@gmail.com') &&
          _emailController.text.isNotEmpty;
      _isPasswordValid = _passwordController.text.length >= 6;
    });
  }

// Ganti dengan IP lokal komputer Anda sesuai sama jaringan yang dipakai
  Future<void> _createAccount() async {
    // Wifi Kos
    const String apiUrl = "http://192.168.18.200:5000/register";
    // const String apiUrl = "http://127.0.0.1:5000/register";
    // Wifi Unjaya
    // final String apiUrl = "http://172.16.13.157:5000/register";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': _emailController.text,
          'password': _passwordController.text,
          'full_name': _fullNameController.text,
        }),
      );

      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'])),
        );
        Navigator.pop(context); // Kembali ke halaman login
      } else {
        _showErrorDialog(responseData['message']);
      }
    } catch (e) {
      _showErrorDialog("An error occurred. Please try again later.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, right: 20, bottom: 32, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              SizedBox(
                width: 331,
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: 32),
              // Description Text
              SizedBox(
                width: 327,
                child: Text(
                  'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xFF898989),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 32),
              // Full Name
              Container(
                width: 327,
                height: 60,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE5E4E3)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 5.0),
                  child: TextField(
                    controller: _fullNameController,
                    onChanged: (_) => _validateForm(),
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        color: Color(0xFFB3B1B0),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Email
              Container(
                width: 327,
                height: 60,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE5E4E3)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 5.0),
                  child: TextField(
                    controller: _emailController,
                    onChanged: (_) => _validateForm(),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0xFFB3B1B0),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Password
              Container(
                width: 327,
                height: 60,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE5E4E3)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 5.0),
                  child: Stack(
                    children: [
                      // TextField for password input
                      TextField(
                        controller: _passwordController,
                        onChanged: (_) => _validateForm(),
                        obscureText: _isPasswordObscured,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xFFB3B1B0),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      // Icon button to toggle password visibility
                      Positioned(
                        left: 235,
                        right: 0,
                        top: 0,
                        child: IconButton(
                          icon: Icon(
                            _isPasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFFB3B1B0),
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured = !_isPasswordObscured;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Terms & Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isAgreed,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isAgreed = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 230,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'I Agree to the',
                            style: TextStyle(
                              color: Color(0xFFB3B1B0),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Color(0xFF8A8A8E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0.36,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              color: Color(0xFF7140FC),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Color(0xFF8A8A8E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0.36,
                            ),
                          ),
                          TextSpan(
                            text: 'and',
                            style: TextStyle(
                              color: Color(0xFFB3B1B0),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Color(0xFF8A8A8E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: 0.36,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Color(0xFF7140FC),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              // Login Link
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Have an account? ',
                        style: TextStyle(
                          color: Color(0xFFB3B1B0),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Color(0xFF7140FC),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigasi ke halaman login saat "Login" diklik
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Get Started Button
              Center(
                child: GestureDetector(
                  onTap: _isAgreed &&
                          _isEmailValid &&
                          _isPasswordValid &&
                          _isFullNameValid
                      ? _createAccount // Call the _createAccount function
                      : null,
                  child: Container(
                    width: 327,
                    height: 60,
                    decoration: BoxDecoration(
                      color: (_isAgreed &&
                              _isEmailValid &&
                              _isPasswordValid &&
                              _isFullNameValid)
                          ? Color(0xFF7140FC)
                          : Color(
                              0xFFD1C9FF), // Mengubah warna berdasarkan status validasi
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
