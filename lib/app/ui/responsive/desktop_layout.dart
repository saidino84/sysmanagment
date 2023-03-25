import 'package:flutter/material.dart';
import 'package:sysmanagment/app/ui/sidemenu/side_menu/side_menu.dart';
import 'package:sysmanagment/app/ui/transferencias/boxes/balancestatus/balancete.dart';
import 'package:sysmanagment/app/ui/transferencias/boxes/exchange/exchangeui.dart';
import 'package:sysmanagment/app/ui/transferencias/transfer_toolbar/transfer_tolbar.dart';

import '../transferencias/components.dart';
import '../transferencias/desktopmainUi.dart.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: SideMenu()),
            Expanded(
                flex: 7,
                child: Column(
                  children: [
                    TransferAppBar(size),
                    DeskTopTranFerMainUI(),
                    Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.amberAccent,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
