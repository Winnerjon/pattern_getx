import 'package:get/get.dart';
import 'package:pattern_getx/controllers/main_controller.dart';
import 'package:pattern_getx/controllers/payment_controller.dart';
import 'package:pattern_getx/controllers/setting_controller.dart';

class ControllersBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<MainController>(MainController());
    Get.put<PaymentController>(PaymentController());
    Get.put<SettingController>(SettingController());
  }
}