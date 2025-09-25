import 'package:get/get.dart';
import '../../../services/vendor_service.dart';

class VendorController extends GetxController {
  var isLoading = true.obs;
  var vendors = <dynamic>[].obs; // ✅ List observable, bukan null

  final VendorService _vendorService = VendorService();

  @override
  void onInit() {
    super.onInit();
    fetchVendors();
  }

  Future<void> fetchVendors() async {
    try {
      isLoading(true);
      final data = await _vendorService.getVendor();
      vendors.assignAll(data); // ✅ isi ke list observable
    } catch (e) {
      vendors.clear(); // kalau gagal, kosongkan list
    } finally {
      isLoading(false);
    }
  }
}
