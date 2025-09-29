import 'package:get/get.dart';

// auth
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';

// home
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

// barang
import '../modules/barang/bindings/barang_binding.dart';
import '../modules/barang/views/barang_view.dart';

// rak
import '../modules/rak/bindings/rak_binding.dart';
import '../modules/rak/views/rak_view.dart';

// barang masuk
import '../modules/barang masuk/bindings/barang_masuk_binding.dart';
import '../modules/barang masuk/views/barang_masuk_view.dart';

// barang keluar
import '../modules/barang keluar/bindings/barang_keluar_binding.dart';
import '../modules/barang keluar/views/barang_keluar_view.dart';

// vendor
import '../modules/vendor/bindings/vendor_binding.dart';
import '../modules/vendor/views/vendor_view.dart';

// laporan
import '../modules/laporan/bindings/laporan_binding.dart';
import '../modules/laporan/views/laporan_view.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () =>  const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.barang,
      page: () => const BarangView(),
      binding: BarangBinding(),
    ),
      GetPage(
      name: Routes.RAK,
      page: () => const RakPage(),
      binding: RakBinding(),
    ),
    GetPage(
      name: Routes.barangMasuk,
      page: () => BarangMasukView(),
      binding: BarangMasukBinding(),
    ),
    GetPage(
      name: Routes.barangKeluar,
      page: () => const BarangKeluarView(),
      binding: BarangKeluarBinding(),
    ),
    GetPage(
      name: Routes.vendor,
      page: () => const VendorView(),
      binding: VendorBinding(),
    ),
    GetPage(
  name: Routes.laporan,
  page: () => const LaporanView(),
  binding: LaporanBinding(),
),

  ];
}

class Routes {
  static const login = '/login';
  static const home = '/home';
  static const barang = '/barang';
  // ignore: constant_identifier_names
  static const RAK = '/rak';
  static const barangMasuk = '/barang-masuk';
  static const barangKeluar = '/barang-keluar';
  static const vendor = '/vendor';
  static var laporan = '/laporan-stok';
}
