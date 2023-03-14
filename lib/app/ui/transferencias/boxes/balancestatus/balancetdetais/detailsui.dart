import 'package:flutter/material.dart';
import 'package:sysmanagment/app/ui/transferencias/boxes/balancestatus/graphicbalance/components/dailyChartStats.dart';

class BalanceDetails extends StatelessWidget {
  const BalanceDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: DailyChartStats(),
    );
  }
}
