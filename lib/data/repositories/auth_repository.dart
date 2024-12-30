import 'package:get/get.dart';
import 'package:store/features/auth/models/user_model.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/image_strings.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();
  final userEmail = 'sajidpv@gmail.com';
  final userPassword = '123123';
  bool user = false;

  @override
  void onReady() {
    user = true; //setpersistences

    super.onReady();
  }

  void screenRedirect() async {
    if (user) {
      Get.offAllNamed(SRoutes.dashboard);
    } else {
      Get.offAllNamed(SRoutes.login);
    }
  }

  Future<dynamic> loginApiCall(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    if (data['email'] == userEmail && data['password'] == userPassword) {
      user = true;
      return UserModel(
          id: 0, name: 'Dev', email: userEmail, password: userPassword);
    } else {
      user = false;
      return null;
    }
  }

  Future<UserModel> fetchUserDetailsApi() async {
    return UserModel(
        id: 0,
        name: 'Dev',
        email: userEmail,
        password: userPassword,
        image: SImages.user);
  }

  Future<dynamic> logoutApi() async {
    await Future.delayed(const Duration(seconds: 2));
    user = false;
  }
}
