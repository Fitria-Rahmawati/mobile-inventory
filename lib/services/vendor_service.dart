import 'dart:convert';
import 'package:http/http.dart' as http;

class VendorService {
  static const String baseUrl = "http://192.168.2.200:8080/api"; // ganti sesuai backend

  Future<List<dynamic>> getVendors() async {
    final response = await http.get(Uri.parse("$baseUrl/vendors"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'] ?? [];
    } else {
      throw Exception("Gagal memuat data vendor");
    }
  }
}
