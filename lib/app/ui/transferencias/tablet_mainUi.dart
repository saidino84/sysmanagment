import 'package:flutter/material.dart';

import 'boxes/balancestatus/balancete.dart';
import 'boxes/exchange/exchangeui.dart';
import 'boxes/transfers.dart';

class TabletmainUi extends StatelessWidget {
  const TabletmainUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
