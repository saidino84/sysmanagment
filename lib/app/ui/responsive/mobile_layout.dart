import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/controllers/AppController.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/ui/sidemenu/side_menu/side_menu.dart';
import 'package:sysmanagment/app/ui/transferencias/transfer_toolbar/components/month_dropdown.dart';
import 'package:sysmanagment/app/ui/transferencias/transfer_toolbar/components/search_input.dart';
import 'package:sysmanagment/app/shared/appColors.dart';
import '../transferencias/mobilemain_ui.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkcolor,
        elevation: 0,
        title: Text('System Manager'),
        actions: [
          Icon(Icons.notifications),
          SizedBox(
            width: defaultPadding / 2,
          ),
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            backgroundImage: AssetImage('assets/saidino/saidino_profile.png'),
          ),
          SizedBox(
            width: defaultPadding,
          ),
        ],
      ),
      drawer: SideMenu(),
      body: Column(
        children: [
          Container(
            // height: 200,
            color: AppColors.darkcolor,
            padding: EdgeInsets.only(
              bottom: defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonthDropDownMenu(controller: Get.find<AppController>()),
                SearchInput(
                  width: 360,
                ),
              ],
            ),
          ),
          MobiletransmainUI(),
        ],
      ),
    );
  }
}
