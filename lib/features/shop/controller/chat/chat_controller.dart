import 'package:get/get.dart';
import 'package:store/features/auth/models/user_model.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  RxBool onChatScreen = false.obs;
  UserModel conversationUser = UserModel();
  void changeChatScreen(val) {
    onChatScreen.value = val;
  }

  void conversationUserClicked(UserModel user) {
    conversationUser = user;
  }
}
