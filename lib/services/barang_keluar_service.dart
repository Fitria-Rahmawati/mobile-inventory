import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class BarangKeluarService {
  static const String baseUrl = "http://192.168.2.200:8080/api";

  Future<List<dynamic>> getBarangKeluar() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/barang-keluar"),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'];
    } else {
      throw Exception("Gagal ambil data barang keluar");
    }
  }

  Future<void> tambahBarangKeluar(Map<String, dynamic> body) async {
    final token = await AuthService.getToken();
    final response = await http.post(
      Uri.parse("$baseUrl/barang-keluar"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    if (response.statusCode != 201) {
      throw Exception("Gagal tambah barang keluar");
    }
  }
}
