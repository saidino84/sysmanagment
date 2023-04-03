import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/controllers/AppController.dart';
import 'package:sysmanagment/app/data/models/meses.dart';
import 'package:sysmanagment/app/ui/transferencias/appColors.dart';

class MonthDropDownMenu extends StatelessWidget {
  const MonthDropDownMenu({
    super.key,
    required this.controller,
  });

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
    });
  }
}
