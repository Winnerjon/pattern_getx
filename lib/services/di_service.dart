import 'package:get/get.dart';
import 'package:pattern_getx/controllers/main_controller.dart';
import 'package:pattern_getx/controllers/payment_controller.dart';
import 'package:pattern_getx/controllers/setting_controller.dart';

class DIService {
  static Future<void> init() async {
    Get.lazyPut(() => MainController(),fenix: true);
    Get.lazyPut(() => PaymentController(),fenix: true);
    Get.lazyPut(() => SettingController(),fenix: true);
  }
}