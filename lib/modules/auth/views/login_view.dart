import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ✅ Gambar/logo di atas (bisa diganti dengan asset/logo kamu)
              SizedBox(
                height: 120,
                child: Image.asset(
                  "assets/images/logo_inventory.png", // pastikan ada di pubspec.yaml
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 32),

              const Text(
                "Mobile Inventory",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 32),

              /// Input Username
              TextField(
                controller: controller.usernameController,
                decoration: const InputDecoration(
                  labelText: "Username / Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),

              /// Input Password
              Obx(() => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          controller.isPasswordHidden.value =
                              !controller.isPasswordHidden.value;
                        },
                      ),
                    ),
                  )),

              const SizedBox(height: 24),

              /// Tombol Login
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => controller.login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                   ),
                   child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
