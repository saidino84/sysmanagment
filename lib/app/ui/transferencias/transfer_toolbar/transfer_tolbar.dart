import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/controllers/AppController.dart';
import 'package:sysmanagment/app/data/models/meses.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/ui/responsive/responsive.dart';
import 'package:sysmanagment/app/ui/transferencias/transfer_toolbar/components/users_dropdown.dart';
import 'package:sysmanagment/app/ui/transferencias/appColors.dart';

import 'components/month_dropdown.dart';
import 'components/search_input.dart';

class TransferAppBar extends GetView<AppController> {
  const TransferAppBar(
    this.size, {
    Key? key,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkcolor),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      // constraints: BoxConstraints(maxHeight: size.height * 0.1, minHeight: 60),
      // constraints: BoxConstraints(maxHeight: size.height * 0.1, minHeight: 60),
      height: 60,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text(
              'REGISTOS',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(5),
                constraints: BoxConstraints(maxWidth: 200),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() {
                  return DropdownButton<Month>(
                    elevation: 0,
                    underline: Container(),
                    borderRadius: BorderRadius.circular(20),
                    value: controller.curentMountId,
                    icon: Icon(Icons.keyboard_arrow_down),
                    dropdownColor: AppColors.darkcolor,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.bodyTextcolor),
                    items: controller.meses.map<DropdownMenuItem<Month>>(
                      (Month value) {
                        return DropdownMenuItem<Month>(
                            value: value, child: Text('${value.name}'));
                      },
                    ).toList(),
                    onChanged: (Month? value) {
                      controller.changeMonth(value!);
                    },
                  );
                }),
              ),
            ),
          ]),
          // Spacer(),
          Expanded(
            child: Container(
              // constraints: BoxConstraints(maxWidth: 200, minWidth: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: defaultPadding,
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!ResponsiveLayout.isMobile(context))
                            SearchInput(),
                          Icon(Icons.notifications),
                          SizedBox(
                            width: defaultPadding / 2,
                          ),

                          // CircleAvatar(
                          //   backgroundColor: Colors.blueAccent,
                          //   backgroundImage: AssetImage(
                          //       'assets/saidino/saidino_profile.png'),
                          // ),
                          SizedBox(
                            width: defaultPadding,
                          ),
                          if (!ResponsiveLayout.isMobile(context) &&
                              !ResponsiveLayout.islargeMobile(context))
                            // MonthDropDownMenu(controller: controller)
                            UsersDropDownMenu(controller: Get.find())
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // if (!ResponsiveLayout.isMobile(context))
          //   SizedBox(
          //     width: defaultPadding,
          //   ),
        ],
      ),
    );
  }
}
