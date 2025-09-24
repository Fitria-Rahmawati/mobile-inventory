import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => controller.logout(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              "Selamat datang, ${controller.username.value}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildMenuCard(
                    icon: Icons.inventory,
                    label: "Barang",
                    onTap: () => Get.toNamed('/barang'),
                  ),
                  _buildMenuCard(
                    icon: Icons.business,
                    label: "Vendor",
                    onTap: () => Get.toNamed('/vendor'),
                  ),
                  _buildMenuCard(
                    icon: Icons.people,
                    label: "User",
                    onTap: () => Get.toNamed('/user'),
                  ),
                  _buildMenuCard(
                    icon: Icons.input,
                    label: "Barang Masuk",
                    onTap: () => Get.toNamed('/barang-masuk'),
                    ),
                    _buildMenuCard(
                      icon: Icons.output,
                      label: "Barang Keluar",
                      onTap: () => Get.toNamed('/barang-keluar'),
                    ),
                  _buildMenuCard(
                    icon: Icons.report,
                    label: "Laporan",
                    onTap: () => Get.toNamed('/laporan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
