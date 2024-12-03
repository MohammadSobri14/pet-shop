import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {
  final String baseUrl = 'http://192.168.18.200/petshop'; // Ganti dengan URL backend Anda

  Future<Map<String, dynamic>> login(String email, String password) async {
    final Uri url = Uri.parse('$baseUrl/login.php');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to connect to the server');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> register(
      String email, String password, String name) async {
    final Uri url = Uri.parse('$baseUrl/register.php');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
          'name': name,
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to connect to the server');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
