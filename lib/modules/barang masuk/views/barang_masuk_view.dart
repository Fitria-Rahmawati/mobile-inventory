import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_masuk_controller.dart';

// ignore: use_key_in_widget_constructors
class BarangMasukView extends StatelessWidget {
  final BarangMasukController controller = Get.put(BarangMasukController());

  @override
  Widget build(BuildContext context) {
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
            final bm = controller.barangMasukList[index];
            final detailList = bm['detail_masuk'] ?? [];

            return ExpansionTile(
              title: Text(
                bm['nama_vendor'] ?? "No Vendor",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Tanggal: ${bm['tanggal']}"),
              children: [
                ...detailList.map<Widget>((detail) {
                  return ListTile(
                    title: Text(detail['nama_barang'] ?? "-"),
                    subtitle: Text(
                      "${detail['jumlah']} x Rp${detail['harga']}",
                    ),
                    trailing: Text(
                      "Rp${detail['total_harga']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ],
            );
          },
        );
      }),
    );
  }
}
