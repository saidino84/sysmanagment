import 'package:flutter/material.dart';
import 'package:sysmanagment/app/ui/sidemenu/side_menu/side_menu.dart';
import 'package:sysmanagment/app/ui/transferencias/boxes/balancestatus/balancete.dart';
import 'package:sysmanagment/app/ui/transferencias/boxes/exchange/exchangeui.dart';
import 'package:sysmanagment/app/ui/transferencias/transfer_toolbar/transfer_tolbar.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';
import '../transferencias/components.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TransferPalet.darkcolor,
          elevation: 0,
        ),
        drawer: SideMenu(),
        body: Column(
          children: [
            TransferAppBar(size),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10.2),
                primary: true,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(flex: 2, child: ExchangeUi()),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(flex: 4, child: BalanceStatus())
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TransfersUi(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
