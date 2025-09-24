import 'package:get/get.dart';
import '../../../services/barang_service.dart';

class BarangController extends GetxController {
  var isLoading = false.obs;
  var barangList = [].obs;

  final BarangService _barangService = BarangService();

  @override
  void onInit() {
    super.onInit();
    fetchBarang();
  }

  Future<void> fetchBarang() async {
    try {
      isLoading.value = true;
      final data = await _barangService.getBarang();
      barangList.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
