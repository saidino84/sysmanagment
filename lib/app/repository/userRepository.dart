import 'package:get/get_core/get_core.dart';
import 'package:sysmanagment/app/data/database/firebase/user_provider.dart';
import 'package:sysmanagment/app/data/models/users.dart';
import 'package:sysmanagment/app/ui/global/flash_msg.dart';
import 'package:sysmanagment/shared.dart';

class UserRepository {
  static final userProvider = UserProvider();
  static Future<List<UserModel>> getUsers() async {
    final users = await userProvider
        .getUsersAsFuture()
        .then((value) => value)
        .onError((error, stackTrace) => []);
    return users;
  }

  static Future<UserModel?> getCurrentUser() async {
    return userProvider
        .getCurrentUser()
        .then((value) => value)
        .onError((error, stackTrace) {
      print('XXXXXXXERROR ON FECH URRENT USER $error');
      SnackMessager.showMessage(Get.context!, MessageType.ERROR, '$error');
      return UserModel(name: 'anonimo');
    });
  }
}
