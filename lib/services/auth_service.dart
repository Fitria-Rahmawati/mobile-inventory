import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = "http://192.168.2.200:8080/api"; // ganti sesuai backend

  Future<Map<String, dynamic>> login(String identity, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "identity": identity,
        "password": password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data['status'] == 'success') {
      final token = data['data']['access_token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      return {"success": true, "message": "Login berhasil"};
    } else {
      return {
        "success": false,
        "message": data['message'] ?? "Login gagal",
      };
    }
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
