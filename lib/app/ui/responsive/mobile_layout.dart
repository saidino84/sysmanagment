import 'package:flutter/material.dart';
import 'package:sysmanagment/app/ui/transferencias/boxes/balancestatus/balancete.dart';
import 'package:sysmanagment/app/ui/transferencias/boxes/exchange/exchangeui.dart';
import 'package:sysmanagment/app/ui/transferencias/transfer_toolbar/transfer_tolbar.dart';

import '../transferencias/components.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TransferAppBar(size),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    ExchangeUi(),
                    SizedBox(
                      height: 18,
                    ),
                    BalanceStatus(),
                    SizedBox(
                      height: 18,
                    ),
                    TransfersUi()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
