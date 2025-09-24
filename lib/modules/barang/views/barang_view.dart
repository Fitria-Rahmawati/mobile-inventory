import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/barang_controller.dart';

class BarangView extends StatelessWidget {
  const BarangView({super.key});

  @override
  Widget build(BuildContext context) {
    final BarangController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Barang"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.fetchBarang(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.barangList.isEmpty) {
          return const Center(child: Text("Tidak ada data"));
        }

        return ListView.builder(
          itemCount: controller.barangList.length,
          itemBuilder: (context, index) {
            final barang = controller.barangList[index];
            return ListTile(
              title: Text(barang['nama_barang'] ?? '-'),
              subtitle: Text("Stok: ${barang['stok'] ?? 0}"),
              trailing: Text("Rp ${barang['harga'] ?? 0}"),
            );
          },
        );
      }),
    );
  }
}
