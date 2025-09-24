import 'package:get/get.dart';
import '../../../services/vendor_service.dart';

class VendorController extends GetxController {
  final VendorService _service = Get.find<VendorService>();

  var vendors = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVendors();
  }

  Future<void> fetchVendors() async {
    isLoading.value = true;
    try {
      final data = await _service.getVendors();
      vendors.value = data;
    } finally {
      isLoading.value = false;
    }
  }
}
