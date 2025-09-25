import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class BarangService {
  static const String baseUrl = "http://192.168.2.200:8080/api";

  /// Ambil semua barang (list)
  Future<List<dynamic>> getBarang() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/barang"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        return List.from(data['data']);
      } else {
        throw Exception(data['message'] ?? "Gagal ambil data barang");
      }
    } else {
      throw Exception("Server error ${response.statusCode}");
    }
  }
Future<List<dynamic>> getAll() async {
  final token = await AuthService.getToken();
  final response = await http.get(
    Uri.parse("$baseUrl/barang"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  final data = jsonDecode(response.body);
  if (response.statusCode == 200 && data['status'] == 'success') {
    return List.from(data['data']);
  } else {
    throw Exception(data['message'] ?? "Gagal ambil list barang");
  }
}

  /// Ambil detail barang berdasarkan ID
  Future<Map<String, dynamic>> getDetail(String idBarang) async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/barang/$idBarang"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        return Map<String, dynamic>.from(data['data']);
      } else {
        throw Exception(data['message'] ?? "Detail barang tidak ditemukan");
      }
    } else {
      throw Exception("Server error ${response.statusCode}");
    }
  }
}
