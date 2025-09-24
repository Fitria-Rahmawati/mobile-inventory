import 'package:get/get.dart';
import '../../../services/barang_masuk_service.dart';

class BarangMasukController extends GetxController {
  var isLoading = false.obs;
  var barangMasukList = [].obs;

  final _service = BarangMasukService();

  @override
  void onInit() {
    super.onInit();
    fetchBarangMasuk();
  }

  Future<void> fetchBarangMasuk() async {
    try {
      isLoading.value = true;
      final data = await _service.getBarangMasuk();
      barangMasukList.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
