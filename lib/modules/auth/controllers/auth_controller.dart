import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordHidden = true.obs;

  Future<void> login() async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Username dan Password wajib diisi",
          backgroundColor: Colors.red.shade200);
      return;
    }

    try {
      final authService = AuthService();
      final result = await authService.login(username, password);

      if (result["success"]) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.snackbar("Login Gagal", result["message"],
            backgroundColor: Colors.red.shade200);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red.shade200);
    }
  }
}
