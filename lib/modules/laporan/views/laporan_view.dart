import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/laporan_controller.dart';

class LaporanView extends StatelessWidget {
  const LaporanView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LaporanController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Laporan Stok")),
      body: Column(
        children: [
          // 🔹 Dropdown filter
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return DropdownButton<String>(
                value: controller.filterType.value,
                items: const [
                  DropdownMenuItem(value: "harian", child: Text("Harian")),
                  DropdownMenuItem(value: "bulanan", child: Text("Bulanan")),
                  DropdownMenuItem(value: "tahunan", child: Text("Tahunan")),
                ],
                onChanged: (value) {
                  controller.filterType.value = value!;
                  controller.fetchLaporan(); // refresh data sesuai filter
                },
              );
            }),
          ),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.laporanList.isEmpty) {
                return const Center(child: Text("Tidak ada data laporan"));
              }
              return ListView.builder(
                itemCount: controller.laporanList.length,
                itemBuilder: (context, index) {
                  final item = controller.laporanList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item['nama_barang'] ?? "Tanpa Nama"),
                      subtitle: Text("Tipe: ${item['tipe']} | Tanggal: ${item['created_at']}"),
                      trailing: Text("Jumlah: ${item['jumlah']}"),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
