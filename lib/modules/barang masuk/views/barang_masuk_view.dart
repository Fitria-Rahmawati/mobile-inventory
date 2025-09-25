import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_masuk_controller.dart';

class BarangMasukView extends StatelessWidget {
  const BarangMasukView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BarangMasukController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Barang Masuk")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.barangMasukList.isEmpty) {
          return const Center(child: Text("Belum ada data barang masuk"));
        }
        return ListView.builder(
  itemCount: controller.barangMasukList.length,
  itemBuilder: (context, index) {
    final item = controller.barangMasukList[index] ?? {};

  final namaVendor = item?['nama_vendor']?.toString() ?? "No Vendor";
final tanggal    = item?['tanggal']?.toString() ?? "-";


    final total = (item['detail_masuk'] != null && item['detail_masuk'].isNotEmpty)
        ? item['detail_masuk']
            .map((d) => int.tryParse(d['total_harga'].toString()) ?? 0)
            .reduce((a, b) => a + b)
            .toString()
        : "0";

    return Card(
      child: ListTile(
        title: Text(namaVendor),
        subtitle: Text("Tanggal: $tanggal"),
        trailing: Text("Total: $total"),
      ),
    );
  },
);
      }),
    );
  }
}