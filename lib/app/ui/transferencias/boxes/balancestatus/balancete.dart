import 'package:flutter/material.dart';
import 'package:sysmanagment/app/ui/responsive/responsive.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';

import 'components.dart';

class BalanceStatus extends StatelessWidget {
  const BalanceStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      constraints: BoxConstraints(
          maxHeight: ResponsiveLayout.isMobile(context) ? 510 : 300,
          minHeight: 260),
      // width: double.infinity,
      decoration: BoxDecoration(
          // color: TransferPalet.yellowdown,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            height: 35,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TransferPalet.secondary,
                borderRadius: BorderRadius.circular(8)),
            child: Text('Your Storage Details'),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: TransferPalet.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Componets()),
          )
        ],
      ),
    );
  }
}
