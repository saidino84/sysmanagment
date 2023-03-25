import 'package:flutter/material.dart';

import '../global/chart_line.dart';
import 'boxes/balancestatus/balancete.dart';
import 'boxes/exchange/exchangeui.dart';
import 'boxes/transfers.dart';

class MobiletransmainUI extends StatelessWidget {
  const MobiletransmainUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
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
                  TransfersUi(),
                  ManualGraphicChart(
                    size: size,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
