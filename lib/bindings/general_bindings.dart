import 'package:get/get.dart';
// import 'package:store/features/auth/controllers/login_controller.dart';
import 'package:store/features/auth/controllers/user_controller.dart';
import 'package:store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
    // Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}
