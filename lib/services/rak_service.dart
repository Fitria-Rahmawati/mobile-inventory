import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class RakService {
  static const String baseUrl = "http://192.168.2.200:8080/api";

  Future<List<dynamic>> getRak() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/rak"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']; // pastikan API mengembalikan key "data"
    } else {
      throw Exception("Gagal mengambil data Rak");
    }
  }
}
