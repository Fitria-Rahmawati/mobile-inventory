import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/auth_service.dart';

class LaporanService {
  static const String baseUrl = "http://192.168.2.200:8080/api";

  Future<List<dynamic>> getLaporan(String tipe,
      {String? tanggal, String? bulan, String? tahun}) async {
    final token = await AuthService.getToken();

    final queryParams = {
      "tipe": tipe,
      if (tanggal != null) "tanggal": tanggal,
      if (bulan != null) "bulan": bulan,
      if (tahun != null) "tahun": tahun,
    };

    final uri = Uri.parse("$baseUrl/laporan-stok/filter")
        .replace(queryParameters: queryParams);

    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

if (response.statusCode == 200) {
  final data = jsonDecode(response.body);

  if (data['status'] == 'success') {
    final hasil = data['data'];

    // Kalau hasil sudah berupa List
    if (hasil is List) {
      return List.from(hasil);
    }

    // Kalau hasil berupa Map (misalnya show/$id)
    if (hasil is Map<String, dynamic>) {
      return [hasil]; // bungkus jadi List supaya konsisten
    }

    return [];
  } else {
    throw Exception(data['message'] ?? "Gagal mengambil laporan");
  }
} else {
  throw Exception("Server error ${response.statusCode}");
}
  }
}