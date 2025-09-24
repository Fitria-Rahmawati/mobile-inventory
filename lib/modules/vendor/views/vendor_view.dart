import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vendor_controller.dart';

class VendorView extends GetView<VendorController> {
  const VendorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Vendor")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.vendors.isEmpty) {
          return const Center(child: Text("Tidak ada data vendor"));
        }

        return ListView.builder(
          itemCount: controller.vendors.length,
          itemBuilder: (context, index) {
            final vendor = controller.vendors[index];
            return ListTile(
              title: Text(vendor['nama_vendor'] ?? 'Tanpa Nama'),
              subtitle: Text(vendor['alamat'] ?? ''),
              trailing: Text(vendor['telepon'] ?? ''),
            );
          },
        );
      }),
    );
  }
}
