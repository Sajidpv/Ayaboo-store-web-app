import 'package:get/get.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/features/auth/models/user_model.dart';
import 'package:store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel().obs;
  final userRepository = Get.put(AuthRepository());

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await userRepository.fetchUserDetailsApi();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      SLoaders.errorSnackBar(
          title: 'Something went wrong', message: e.toString());
      return UserModel();
    }
  }
}
