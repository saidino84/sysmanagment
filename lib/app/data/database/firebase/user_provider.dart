import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sysmanagment/app/data/models/users.dart';

class UserProvider {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  CollectionReference get _sysRef => firestore.collection('sysmanagment/');
  CollectionReference get _userRef =>
      firestore.collection('sysmanagment/users/');

// Future<User> getUser(){
  // CollectionReference _usersRef=_sysRef.doc()
// }

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
