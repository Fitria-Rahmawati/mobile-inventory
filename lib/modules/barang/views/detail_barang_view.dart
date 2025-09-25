import 'package:flutter/material.dart';
import '../../../services/barang_service.dart';

class DetailBarangView extends StatefulWidget {
  final String idBarang;
  const DetailBarangView({super.key, required this.idBarang});

  @override
  State<DetailBarangView> createState() => _DetailBarangViewState();
}

class _DetailBarangViewState extends State<DetailBarangView> {
  Map<String, dynamic>? detail;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDetail();
  }

  Future<void> fetchDetail() async {
    try {
      final data = await BarangService().getDetail(widget.idBarang);
      setState(() {
        detail = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal ambil detail: $e")),
      );
    }
  }

  Widget buildRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 120, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value ?? "-", softWrap: true)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Barang")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : detail == null
              ? const Center(child: Text("Data tidak ditemukan"))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRow("Barcode", detail!['barcode']),
                      buildRow("Kode Barang", detail!['kode_barang']),
                      buildRow("Nama Barang", detail!['nama_barang']),
                      buildRow("Kategori", detail!['nama_kategori']),
                      buildRow("Vendor", detail!['nama_vendor']),
                      buildRow("Rak", detail!['nama_rak']),
                      buildRow("Sub Rak", detail!['nama_sub_rak']),
                      buildRow("Stok", detail!['stok'].toString()),
                      buildRow("Harga Beli", "Rp ${detail!['harga_beli']}"),
                      buildRow("Harga Jual", "Rp ${detail!['harga_jual']}"),
                      buildRow("Deskripsi", detail!['deskripsi']),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Kembali"),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
