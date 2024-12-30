import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/utils/helpers/network_manager.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final localStorage = GetStorage();
  RxBool isObscureText = true.obs;
  RxBool rememberMe = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController.text = localStorage.read('email') ?? '';
    passwordController.text = localStorage.read('password') ?? '';
    super.onInit();
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      SFullScreenLoader.openLoadingDialog('Loading', '');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write('email', emailController.text.trim());
        localStorage.write('password', passwordController.text.trim());
      }

      await AuthRepository.instance.loginApiCall({
        'email': emailController.text.trim(),
        'password': passwordController.text.trim()
      });
      SFullScreenLoader.stopLoading();
      if (!AuthRepository.instance.user) {
        SLoaders.errorSnackBar(
            title: 'Not Authorized',
            message: 'You are not authorized to access, Contact admin!');
      } else {
        AuthRepository.instance.screenRedirect();
      }
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oopz!', message: e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      SFullScreenLoader.openLoadingDialog('Logging out', '');
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      await AuthRepository.instance.logoutApi();
      SFullScreenLoader.stopLoading();
      AuthRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oopz!', message: e.toString());
    }
  }
}
