import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VendorService {
  static const String baseUrl = "http://192.168.2.200:8080/api";

  Future<List<dynamic>> getVendor() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse("$baseUrl/vendor"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // ✅ pakai token login
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'] ?? [];
    } else {
      throw Exception("Gagal memuat data vendor (${response.statusCode})");
    }
  }
}
