import 'package:get/get.dart';
import '../../../services/auth_service.dart';

class HomeController extends GetxController {
  var username = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  Future<void> loadUser() async {
    // misal nanti bisa ambil dari token decode atau API user profile
    username.value = "User"; 
  }

  Future<void> logout() async {
    await AuthService.logout();
    Get.offAllNamed('/login');
  }
}
