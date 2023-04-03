import 'package:flutter/material.dart';
import 'package:sysmanagment/app/controllers/userController.dart';
import 'package:sysmanagment/app/data/models/users.dart';
import 'package:sysmanagment/app/shared/constants.dart';
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
          if (users.hasError) {
            return Text('ERRO');
          }
          if (users.hasData) {
            print('**********APplyng data*********');
            return DropdownButton<UserModel?>(
              elevation: 0,
              // value: users.data![0],
              underline: Container(),
              borderRadius: BorderRadius.circular(20),
              value: users.data![0],
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: TransferPalet.darkcolor,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: TransferPalet.bodyTextcolor),
              items: users.data!.map<DropdownMenuItem<UserModel?>>(
                (UserModel value) {
                  return DropdownMenuItem<UserModel?>(
                      value: value,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: TransferPalet.primaryColor,
                            child: Text(
                              '${value.name![0].toUpperCase()}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: defaultPadding / 3,
                          ),
                          Text(
                            '${value.name}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ));
                },
              ).toList(),
              onChanged: (UserModel? value) {
                print('Changing user');
                controller.changeUser(value!);
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
