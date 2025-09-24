import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class BarangMasukService {
  static const String baseUrl = "http://192.168.2.200:8080/api";

  Future<List<dynamic>> getBarangMasuk() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/barang-masuk"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception("Gagal ambil data barang masuk");
    }
  }

  Future<void> tambahBarangMasuk(Map<String, dynamic> body) async {
    final token = await AuthService.getToken();
    final response = await http.post(
      Uri.parse("$baseUrl/barang-masuk"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    if (response.statusCode != 201) {
      throw Exception("Gagal tambah barang masuk");
    }
  }
}
