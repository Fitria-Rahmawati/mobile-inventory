import 'package:get/get.dart';
import '../../../services/barang_keluar_service.dart';

class BarangKeluarController extends GetxController {
  var isLoading = false.obs;
  var barangKeluarList = [].obs;

  final _service = BarangKeluarService();

  @override
  void onInit() {
    super.onInit();
    fetchBarangKeluar();
  }

  Future<void> fetchBarangKeluar() async {
    try {
      isLoading.value = true;
      final data = await _service.getBarangKeluar();
      barangKeluarList.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
