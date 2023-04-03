import 'package:flutter/material.dart';
import 'package:sysmanagment/app/ui/global/chart_line.dart';
import 'package:sysmanagment/app/ui/sidemenu/side_menu/side_menu.dart';
import 'package:sysmanagment/app/ui/transferencias/tablet_mainUi.dart';
import 'package:sysmanagment/app/ui/transferencias/transfer_toolbar/transfer_tolbar.dart';
import 'package:sysmanagment/app/ui/transferencias/appColors.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkcolor,
          elevation: 0,
        ),
        drawer: SideMenu(),
        body: Column(
          children: [
            TransferAppBar(size),
            TabletmainUi(),
          ],
        ));
  }
}
