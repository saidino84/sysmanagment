import 'package:sysmanagment/app/data/models/users.dart';
import 'package:sysmanagment/app/repository/userRepository.dart';
import 'package:sysmanagment/shared.dart';

class UserController extends GetxController {
  UserModel? currentUser;
  late List<UserModel> users;

  onInit() {
    getCurrentUser;
    getUsersAsFutue.then((value) {
      users = value;
      print('USERS SET DONE');
    });
  }

  Future<List<UserModel>> get getUsersAsFutue async =>
      await UserRepository.getUsers();

  Future<UserModel?> get getCurrentUser async {
    print('########looking up users');
    currentUser = await UserRepository.getCurrentUser().then((value) => value);
    print('User has got');
    return currentUser;
  }
}
