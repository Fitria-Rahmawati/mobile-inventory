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
            final detailKeluar = item['detail_keluar'] ?? [];

            return Card(
              margin: const EdgeInsets.all(8),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header transaksi
                    Text(
                      "Kode: ${item['kode_keluar'] ?? '-'}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Tanggal: ${item['tanggal'] ?? '-'}"),
                    Text("Tujuan: ${item['tujuan'] ?? '-'}"),
                    Text("Keterangan: ${item['keterangan'] ?? '-'}"),

                    const Divider(),

                    // Detail barang keluar
                    const Text(
                      "Detail Barang:",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),

                    if (detailKeluar.isEmpty)
                      const Text("Tidak ada detail barang")
                    else
                      Column(
                        children: List.generate(detailKeluar.length, (i) {
                          final d = detailKeluar[i];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(d['nama_barang'] ?? 'Barang'),
                            subtitle: Text("Jumlah: ${d['jumlah']}"),
                            trailing: Text(
                              "Rp ${d['total_harga']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
