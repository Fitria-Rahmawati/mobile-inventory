import 'package:get/get.dart';
import '../../../services/rak_service.dart';

class RakController extends GetxController {
  var isLoading = true.obs;
  var rakList = [].obs;

  final RakService _rakService = RakService();

  @override
  void onInit() {
    fetchRak();
    super.onInit();
  }

  void fetchRak() async {
    try {
      isLoading(true);
      final data = await _rakService.getRak();
      rakList.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
