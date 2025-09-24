import 'package:get/get.dart';
import '../../../services/laporan_service.dart';

class LaporanController extends GetxController {
  var laporanList = [].obs;
  var isLoading = false.obs;
  var filterType = "harian".obs;

  final LaporanService _service = LaporanService();

  @override
  void onInit() {
    super.onInit();
    fetchLaporan(); // default ambil harian
  }

  Future<void> fetchLaporan({String? tanggal, String? bulan, String? tahun}) async {
    try {
      isLoading(true);
      final data = await _service.getLaporan(
        filterType.value,
        tanggal: tanggal,
        bulan: bulan,
        tahun: tahun,
      );
      laporanList.assignAll(data);
    } catch (e) {
      Get.snackbar("Error", "Gagal ambil laporan: $e");
      laporanList.clear();
    } finally {
      isLoading(false);
    }
  }
}
