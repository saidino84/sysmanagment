import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/controllers/userController.dart';
import 'package:sysmanagment/app/data/models/meses.dart';
import 'package:sysmanagment/app/data/models/users.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';

class UsersDropDownMenu extends StatelessWidget {
  const UsersDropDownMenu({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getUsersAsFutue,
        builder: (context, users) {
          // return Obx(() {

          // print('CURRENT USER IS $users');
          // var d = 0.obs;
          if (users.hasError) {
            return Text('ERRO');
          }
          if (users.hasData) {
            print('######## DADOS FOUNDS ${users.data!.length}');
            return DropdownButton<UserModel?>(
              elevation: 0,
              underline: Container(),
              borderRadius: BorderRadius.circular(20),
              value: controller.currentUser,
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: TransferPalet.darkcolor,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: TransferPalet.bodyTextcolor),
              items: users.data!.map<DropdownMenuItem<UserModel?>>(
                (UserModel value) {
                  return DropdownMenuItem<UserModel?>(
                      value: value, child: Text('${value.name}'));
                },
              ).toList(),
              onChanged: (UserModel? value) {
                // controller.changeMonth(value!);
              },
            );
            // );
          } else {
            return CircleAvatar(
              child: CircularProgressIndicator(
                color: TransferPalet.primaryColor,
              ),
            );
          }
          // }
          // );
        });
  }
}
