import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_keluar_controller.dart';

class BarangKeluarView extends StatelessWidget {
  const BarangKeluarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BarangKeluarController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Barang Keluar")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.barangKeluarList.isEmpty) {
          return const Center(child: Text("Belum ada data barang keluar"));
        }
        return ListView.builder(
          itemCount: controller.barangKeluarList.length,
          itemBuilder: (context, index) {
            final item = controller.barangKeluarList[index];
            return Card(
              child: ListTile(
                title: Text(item['penerima'] ?? "No Penerima"),
                subtitle: Text("Tanggal: ${item['tanggal']}"),
                trailing: Text("Total: ${item['total']}"),
              ),
            );
          },
        );
      }),
    );
  }
}
