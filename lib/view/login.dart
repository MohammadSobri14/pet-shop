import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:petshop/view/createaccount.dart';
import 'package:petshop/view/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleGoogleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Google Login clicked')),
    );
  }

  void _handleFacebookLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Facebook Login clicked')),
    );
  }

  // Ganti dengan IP lokal komputer Anda sesuai sama jaringan yang dipakai
  final String apiUrl = "http://192.168.18.200:5000/login";

  // Fungsi untuk login
  Future<void> loginUser() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      // Kirim request POST ke API
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Jika login berhasil, navigasikan ke HomePage
        if (responseData['status'] == 'success') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          _showErrorDialog(responseData['message']);
        }
      } else {
        _showErrorDialog("Login failed. Please try again.");
      }
    } catch (e) {
      _showErrorDialog("An error occurred. Please try again later.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _validateForm() {
    setState(() {
      _isEmailValid = _emailController.text.contains('@gmail.com');
      _isPasswordValid = _passwordController.text.length >= 6;
    });
  }

  void _navigateToCreateAccount() {
    // You can navigate to the Create Account page here
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateAccountPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 110),
            Padding(
              padding:
                  const EdgeInsets.only(left: 22.0, right: 8.0, bottom: 26.0),
              child: SizedBox(
                width: 345,
                height: 77,
                child: Text(
                  'Hello, \nWelcome Back!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 23.0, right: 21.0, bottom: 32.0),
              child: SizedBox(
                width: 331,
                child: Text(
                  'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color(0xFF898989),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            // Input Email
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
                child: TextField(
                  controller: _emailController,
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
                  onChanged: (_) => _validateForm(),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Input Password
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
                padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 24.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B1B0),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFFB3B1B0),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  onChanged: (_) => _validateForm(),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: 304,
              height: 17,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 9,
                    child: Container(
                      width: 112,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE3E8F1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 192,
                    top: 9,
                    child: Container(
                      width: 112,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE3E8F1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 146,
                    top: 8,
                    child: Opacity(
                      opacity: 0.80,
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: Color(0xFFC6CEDD),
                          fontSize: 12,
                          fontFamily: 'Hind Siliguri',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Google and Facebook Login Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _handleGoogleLogin,
                  child: Container(
                    width: 157,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFE5E4E3)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Google',
                          style: TextStyle(
                            color: Color(0xFF337EFE),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: _handleFacebookLogin,
                  child: Container(
                    width: 157,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFE5E4E3)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/facebook.png",
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Facebook',
                          style: TextStyle(
                            color: Color(0xFF3B5998),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: TextStyle(
                      color: Color(0xFF1A1919),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'Create Account',
                    style: TextStyle(
                      color: Color(0xFF7140FC),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _navigateToCreateAccount,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Get Started Button (Updated style similar to Create Account)
            // Tombol Login
            GestureDetector(
              onTap: (_isEmailValid && _isPasswordValid)
                  ? () {
                      loginUser(); // Panggil API Login
                    }
                  : null,
              child: Container(
                width: 327,
                height: 60,
                decoration: BoxDecoration(
                  color: (_isEmailValid && _isPasswordValid)
                      ? Color(0xFF7140FC)
                      : Color(0xFFD1C9FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
