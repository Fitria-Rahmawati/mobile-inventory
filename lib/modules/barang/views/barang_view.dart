import 'package:flutter/material.dart';
import '../../../services/barang_service.dart';
import 'detail_barang_view.dart';

class BarangView extends StatefulWidget {
  const BarangView({super.key});

  @override
  State<BarangView> createState() => _BarangViewState();
}

class _BarangViewState extends State<BarangView> {
  List<dynamic> barangList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBarang();
  }

  Future<void> fetchBarang() async {
    try {
      final data = await BarangService().getAll(); // ambil list barang
      setState(() {
        barangList = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal ambil data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Barang")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: barangList.length,
              itemBuilder: (context, index) {
                final barang = barangList[index];
                return ListTile(
                  title: Text(barang['nama_barang'] ?? "-"),
                  subtitle: Text("Stok: ${barang['stok']}"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailBarangView(
                          idBarang: barang['id_barang'].toString(),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
