import 'package:get/get.dart';
import '../controllers/vendor_controller.dart';
import '../../../services/vendor_service.dart';

class VendorBinding extends Bindings {
  @override
  void dependencies() {
    // register service
    Get.lazyPut<VendorService>(() => VendorService());

    // register controller
    Get.lazyPut<VendorController>(() => VendorController());
  }
}
