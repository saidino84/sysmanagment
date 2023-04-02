import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sysmanagment/app/data/models/users.dart';

class UserProvider {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  CollectionReference get _sysRef => firestore.collection('sysmanagment/');
  CollectionReference get _userRef =>
      firestore.collection('sysmanagment/transfers/users/');

  Future<List<UserModel>> getUsersAsFuture() async {
    List<UserModel> users = [];
    await _userRef.get().then((value) {
      value.docs.forEach((e) {
        print('Getting users map *********** $e');
        var json = e.data() as Map<String, dynamic>;
        var user = UserModel.fromJson(json);
        print(user.role);
        users.add(user);
      });
    });
    return users;
  }

  Future<UserModel?> getCurrentUser() async {
    UserModel _user = UserModel(name: 'HI');
    var u = await getUsersAsFuture();
    u.forEach((element) {
      if (element.role!.endsWith('admin')) {
        _user = element;
        print(' ******${_user.name}');
      }
    });
    return _user;
  }

  Future<void> addUser() async {
    return _userRef
        .add({
          "name": "sidino",
          "role": 'root',
          "admin": true,
        })
        .then(
          (value) => print(' User added'),
        )
        .catchError((e) => print('Failed to add user $e'));
  }
}
