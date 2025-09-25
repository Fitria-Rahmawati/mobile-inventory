import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rak_controller.dart';

class RakPage extends GetView<RakController> {
  const RakPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rak & Sub Rak")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.rakList.isEmpty) {
          return const Center(child: Text("Data Rak kosong"));
        }

        return ListView.builder(
          itemCount: controller.rakList.length,
          itemBuilder: (context, index) {
            final rak = controller.rakList[index];
            final subRaks = rak['sub_rak'] ?? [];

            return Card(
              margin: const EdgeInsets.all(8),
              child: ExpansionTile(
                title: Text(rak['nama_rak'] ?? 'Tanpa Nama'),
                subtitle: Text(rak['keterangan'] ?? ''),
                children: subRaks.map<Widget>((sub) {
                  return ListTile(
                    title: Text(sub['nama_sub_rak'] ?? ''),
                    subtitle: Text(sub['keterangan'] ?? ''),
                  );
                }).toList(),
              ),
            );
          },
        );
      }),
    );
  }
}
